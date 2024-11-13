//
//  TodoTableViewCell.swift
//  TodoList
//
//  Created by soyoongdev on 12/11/2024.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var checkButton: UIButton!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(todo: Todo) {
//        self.titleLabel.text = todo.title
//        self.descLabel.text = todo.desc
//        self.checkButton.setImage(todo.status ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "checkmark.circle"), for: .normal)
    }
    
}
