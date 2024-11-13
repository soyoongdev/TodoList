//
//  EntryViewController.swift
//  TodoList
//
//  Created by soyoongdev on 11/11/2024.
//

import UIKit

class EntryViewController: UIViewController {
    @IBOutlet var field: UITextField!
    
    // Tạo closure để cập nhật thay đổi
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(self.saveTask))
    }
    
    @objc private func saveTask() {
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        let count = UserDefaultsHelper.shared.getCount()
        
        let newCount = count + 1
        
        UserDefaultsHelper.shared.setCount(newValue: newCount)
        UserDefaultsHelper.shared.setTask(newValue: text, forKey: "task_\(newCount)")
        
        update?()
        
        navigationController?.popViewController(animated: true)
    }
}

extension EntryViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
    
}
