//
//  ViewController.swift
//  ch3_todoList
//
//  Created by 한철희 on 3/20/24.
//

import UIKit

struct Todo {
    var id: Int
    var title: String
    var isCompleted: Bool
}

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var sampleTodo: [Todo] = Todo.sampleTodo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: TodoTableViewCell.identifier, bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: TodoTableViewCell.identifier)
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    //MARK: - addTodo
    @IBAction func addTodo(_ sender: Any) {
        //alert 창 요소들
        let title = "할 일 추가"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        // alert창 버튼 추가 및 기능
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let add = UIAlertAction(title: "추가", style: .default) { (_) in
            // 추가하기 눌렀을 때 처리할 내용
            if let txt = alert.textFields?[0] {
                if let text = txt.text, !text.isEmpty {
                    // 새로운 Todo 객체 생성 및 배열에 추가
                    let newId = (self.sampleTodo.last?.id ?? 0) + 1
                    let newTodo = Todo(id: newId, title: text, isCompleted: false)
                    self.sampleTodo.append(newTodo)
                    
                    // 테이블 뷰 업데이트
                    self.myTableView.reloadData()
                } else {
                    print("입력된 값이 없습니다")
                }
            }
        }
        alert.addAction(cancel)
        alert.addAction(add)
        
        // alert창에 textField추가
        alert.addTextField(){ (tf) in
            tf.placeholder = "할 일을 입력하세요"
        }
        
        self.present(alert, animated: true)
    }
    
}
//MARK: - extension
extension Todo {
    static var sampleTodo: [Todo] = [
        Todo(id: 1, title: "title1", isCompleted: false),
        Todo(id: 2, title: "title2", isCompleted: false)
    ]
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sampleTodo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.identifier, for: indexPath) as? TodoTableViewCell else { return UITableViewCell() }
        
        cell.setData(self.sampleTodo[indexPath.row])
        
        return cell
    }
    // 셀 삭제하는 부분
    func tableView(_ tableView: UITableView, editingStyleForFowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            sampleTodo.remove(at: indexPath.row) // 셀 데이터를 담은 배열을 적어준다.
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}
