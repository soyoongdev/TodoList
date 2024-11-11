//
//  TodoManager.swift
//  TodoList
//
//  Created by soyoongdev on 10/11/2024.
//  MVC
//

import Foundation

class TodoManager {
  
  private(set) var todoList: [Todo] = []
  
  var message: String?
  
  // Add new todo list item
  func addNewItem(todo: Todo) {
    todoList.append(todo)
  }
  
  // Update todo list item
  func updateItem(todo: Todo) {
    if let index = todoList.firstIndex(where: { $0.id == todo.id }) {
      todoList[index] = todo
    } else {
      self.message = "Item not found to update"
    }
  }
  
  // Delete todo list item
  func deleteItem(todo: Todo) {
    if let index = todoList.firstIndex(where: { $0.id == todo.id }) {
      todoList.remove(at: index)
    } else {
      self.message = "Item not found to delete"
    }
  }
  
  // Move todo list item
  func moveItem(new todo: Todo) {
    
  }
}
