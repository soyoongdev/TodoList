//
//  UIView.swift
//  TodoList
//
//  Created by soyoongdev on 10/11/2024.
//

import UIKit

extension UIView {
  
  func pinAnchor(to superView: UIView, constant: CGFloat? = 0) {
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: superView.topAnchor, constant: constant!).isActive = true
    leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant!).isActive = true
    trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: constant!).isActive = true
    bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: constant!).isActive = true
  }
  
}
