//
//  BaseViewController.swift
//  TodoList
//
//  Created by soyoongdev on 10/11/2024.
//

import UIKit

class BaseViewController: UIViewController {
  
  var showRightIcon: Bool = false {
    didSet {
      configurationRightIcon()
    }
  }
  
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      showRightIcon = true
      title = "Todo List"
    }
    
  
  private func configurationRightIcon() {
    if showRightIcon {
      let iconImage = UIImage(systemName: "plus")
      let rightIconButton = UIBarButtonItem(image: iconImage, style: .plain, target: self, action: #selector(rightIconButtonTapped))
      navigationItem.rightBarButtonItem = rightIconButton
    } else {
      navigationItem.rightBarButtonItem = nil
    }
  }
  
  @objc private func rightIconButtonTapped() {
    
  }
}
