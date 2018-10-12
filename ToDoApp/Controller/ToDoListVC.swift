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
    let dataService = DataService()
    var itemArray = [ToDoItem]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        title = "ToDoey"
        tableView.delegate = self       // 注意
        tableView.dataSource = self     // 注意
        
   
        itemArray = dataService.loadFromFile()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func setupLayout() {
        
        navigationController?.navigationBar.tintColor = UIColor.white  // 注意
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)          // 注意
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addBtnTouched))
        
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
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        
        return cell
    }
    
    // MARK: TableView Delegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Some action after select
        let flag = itemArray[indexPath.row].done
        itemArray[indexPath.row].done = !flag
        dataService.saveToFile(items: itemArray)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: Add Button Touched
    @objc func addBtnTouched() {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New ToDoey Item", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add Item", style: UIAlertAction.Style.default) { (action) in
            if !(textField.text?.isEmpty)! {
                let todoItem = ToDoItem(todo: textField.text!)
                self.itemArray.append(todoItem)

                self.dataService.saveToFile(items: self.itemArray)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
