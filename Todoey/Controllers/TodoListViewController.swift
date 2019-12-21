//
//  ViewController.swift
//  Todoey
//
//  Created by yousef Omar on 12/19/19.
//  Copyright © 2019 yousef Omar. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist")

        //= ["finde mike ","buy eggs ","go to school"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItem()
        
    }
     
    //MARK: TableView Datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done == true ? .checkmark : .none
        return cell
    }
    
    //MARK: TableView Delegat
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //check mark: select and deselect
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveData()
        // selection background
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // when select add Item
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.saveData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat new Item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
     func saveData() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(self.itemArray)
            try data.write(to: self.dataFilePath!)
        } catch  {
            print("error incoding item array \(error)")
        }
        self.tableView.reloadData()
    }
    func loadItem() {
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self,from: data)
            } catch  {
                print("error decoding item array \(error)")
            }
        }
    }
}
// !!!: ...
//FIXME: ..
//???: ...
//TODO: func
//MARK: ...


