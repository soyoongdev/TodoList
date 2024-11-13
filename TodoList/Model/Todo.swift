//
//  Todo.swift
//  TodoList
//
//  Created by soyoongdev on 10/11/2024.
//

import Foundation

struct Todo: Codable {
  var id: Int64
  var title: String
  var desc: String
  var status: Bool
}
