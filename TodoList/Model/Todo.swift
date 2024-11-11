//
//  Todo.swift
//  TodoList
//
//  Created by soyoongdev on 10/11/2024.
//

import Foundation

struct Todo: Identifiable {
  var id: UUID
  var title: String
  var description: String
  var status: Status
}
