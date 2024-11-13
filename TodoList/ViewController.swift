//
//  ViewController.swift
//  TodoList
//
//  Created by soyoongdev on 10/11/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    private var tasks: [Todo] = [
        Todo(id: 0, title: "Apple", desc: "Apple desc", status: false),
        Todo(id: 1, title: "Samsung", desc: "Samsung desc", status: false),
        Todo(id: 2, title: "Nokia", desc: "Nokia desc", status: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLayout()
    }
    
    private func setupLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "TodoTableViewCell")
        
        // Setup
        if !UserDefaultsHelper.shared.getSetup() {
            UserDefaultsHelper.shared.setSetup(newValue: true)
            UserDefaultsHelper.shared.setCount(newValue: 0)
        }
        
        // Get all current save tasks
        self.updateTasks()
    }
    
    private func updateTasks() {
        self.tasks.removeAll()
        let count = UserDefaultsHelper.shared.getCount()
        for x in 0..<count {
            if let task = UserDefaultsHelper.shared.getTask(forKey: "task_\(x+1)") {
                self.tasks.append(Todo(id: Int64(x+1), title: task, desc: "task_\(x+1)", status: false))
            }
        }
        self.tableView.reloadData()
    }
    
    @IBAction func didTapAdd() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            // Cập nhật thay đổi UI với luồng chính
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "task") as! TaskViewController
        vc.title = "New task"
        vc.task = self.tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.tasks[indexPath.row].title
        return cell
    }
    
}
