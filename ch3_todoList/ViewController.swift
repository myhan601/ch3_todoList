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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: TodoTableViewCell.identifier, bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: TodoTableViewCell.identifier)
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}

extension Todo {
    static let sampleTodo: [Todo] = [
        Todo(id: 1, title: "title1", isCompleted: false),
        Todo(id: 2, title: "title2", isCompleted: true)
    ]
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Todo.sampleTodo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.identifier, for: indexPath) as? TodoTableViewCell else { return UITableViewCell() }
                
                cell.setData(Todo.sampleTodo[indexPath.row])
                
                return cell
    }
    
    
}
