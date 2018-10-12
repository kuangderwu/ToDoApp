//
//  ToDoItem.swift
//  ToDoApp
//
//  Created by apple on 2018/10/10.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import Foundation

class ToDoItem: Codable {
    
    var title : String
    var done: Bool = false
    init(todo: String) {
        self.title = todo
    }
    
}
