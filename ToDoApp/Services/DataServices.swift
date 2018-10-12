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
    private let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("todoItems.plist")
    
    func getAll() -> [ToDoItem] {
        return todoItems
    }
    
    func add(item: ToDoItem) {
        todoItems.append(item)
    }
    
    
    func saveToFile(items: [ToDoItem]) {
        
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath!)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadFromFile() -> [ToDoItem] {
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                todoItems = try decoder.decode([ToDoItem].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
        return todoItems
    }
}
