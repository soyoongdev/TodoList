//
//  TaskViewController.swift
//  TodoList
//
//  Created by soyoongdev on 11/11/2024.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLayout()
    }
    
    private func setupLayout() {
        self.label.text = self.task?.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc private func deleteTask() {
//        UserDefaultsHelper.shared.setTask(newValue: "")
        if let _task = self.task {
            UserDefaultsHelper.shared.clear(with: "task_\(_task.id)")
            navigationController?.popViewController(animated: true)
        }
    }
    
}
