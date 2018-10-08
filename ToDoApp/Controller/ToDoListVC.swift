//
//  ToDoListVC.swift
//  ToDoApp
//
//  Created by apple on 2018/10/8.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import UIKit

class ToDoListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var todoListView: ToDoListView!
    var tableView: UITableView!
    var itemArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        title = "ToDoey"
        tableView.delegate = self       // 注意
        tableView.dataSource = self     // 注意
        prepareData()                   // 注意
    }
    
    func prepareData() {
        itemArray.append("ToDo Item 1")
        itemArray.append("ToDo Item 2")
        itemArray.append("ToDo Item 3")
    }
    
    private func setupLayout() {
        
        navigationController?.navigationBar.tintColor = UIColor.white  // 注意
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)          // 注意
        todoListView = ToDoListView(frame: self.view.frame)
        self.view.addSubview(todoListView)
        tableView = todoListView.tableView  // 注意
    }

    // MARK: TableView Datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // MARK: TableView Delegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Some action after select
        if  tableView.cellForRow(at: indexPath)?.accessoryType ==  .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
