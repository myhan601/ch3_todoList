//
//  TodoTableViewCell.swift
//  ch3_todoList
//
//  Created by 한철희 on 3/21/24.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    static let identifier = "TodoTableViewCell"
    
    @IBOutlet weak var todoTitleLabel: UILabel!
    @IBOutlet weak var todoCheckSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ todoData: Todo){
        todoTitleLabel.text = todoData.title
        todoCheckSwitch.isOn = todoData.isCompleted
    }
}
