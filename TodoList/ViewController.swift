//
//  ViewController.swift
//  TodoList
//
//  Created by soyoongdev on 10/11/2024.
//

import UIKit

class ViewController: BaseViewController {
  private let label: UILabel = {
    let label = UILabel()
    label.text = "Todo List"
    label.font = .systemFont(ofSize: 18, weight: .medium)
    return label
  }()
  
  private let tableView: UITableView = {
    let table = UITableView()
    
    return table
  }()
  
  private let addButtonView: UIButton = {
    let button = UIButton(type: .system)
    let iconView = UIImage(systemName: "plus")
    iconView?.withTintColor(.blue)
    button.setImage(iconView, for: .normal)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setupLayout()
  }

  @objc private func addButtonAction(_ sender: Any) {
    print("Tapped")
  }
  
}

extension ViewController {
  private func setupLayout() {
    tableView.delegate = self
    tableView.dataSource = self
    
    view.addSubview(label)
    view.addSubview(tableView)
    view.addSubview(addButtonView)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    addButtonView.translatesAutoresizingMaskIntoConstraints = false
    
    // Setup constraint
    NSLayoutConstraint.activate([
      // Label
      label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),

      // Button
      addButtonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      addButtonView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
      addButtonView.widthAnchor.constraint(equalToConstant: 32),
      addButtonView.heightAnchor.constraint(equalToConstant: 32),

      // TableView
      tableView.topAnchor.constraint(equalTo: label.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])

    addButtonView.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = "\(indexPath)"
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 10
  }
  
}
