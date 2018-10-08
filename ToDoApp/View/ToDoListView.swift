//
//  ToDoListView.swift
//  ToDoApp
//
//  Created by apple on 2018/10/8.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import UIKit

class ToDoListView: UIView {

    var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        tableView = UITableView(frame: self.frame, style: UITableView.Style.plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ToDoCell")
        self.addSubview(tableView)

    }

}
