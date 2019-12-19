//
//  ViewController.swift
//  Todoey
//
//  Created by yousef Omar on 12/19/19.
//  Copyright © 2019 yousef Omar. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    let itemArray = ["finde mike ","buy eggs ","go to school"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
     
    //MARK: TableView Datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK: TableView Delegat
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //check mark: select and deselect
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        // selection background
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
// !!!: ...
//FIXME: ..
//???: ...
//TODO: func
//MARK: ...


