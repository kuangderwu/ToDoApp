//
//  DataServices.swift
//  ToDoApp
//
//  Created by apple on 2018/10/10.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import Foundation

class DataService {
    
    
    private var todoItems = [ToDoItem]()
    
    func getAll() -> [ToDoItem] {
        return todoItems
    }
    
    func add(item: ToDoItem) {
        todoItems.append(item)
    }
    
    func saveToDefault() {
        
    }
}
