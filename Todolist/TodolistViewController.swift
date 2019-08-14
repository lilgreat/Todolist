//
//  ViewController.swift
//  Todolist
//
//  Created by Lilya on 12/08/2019.
//  Copyright © 2019 Lilya. All rights reserved.
//

import UIKit

class TodolistViewController: UITableViewController {
    
    var itemArray = ["Buy milk", "Dont forget keys", "Close the fridge door"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        // you write your todolist item here
        let alert = UIAlertController(title: "Add new Todolist item", message: "", preferredStyle: .alert)
        
            // the button you press when you are done writing your todolist message
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            // this is where i'll code the stuff that will happen when the item is appended
            
            self.itemArray.append(textField.text ?? "Be a kinder person")
            
            // the "magic" method
            self.tableView.reloadData()
        }
        
        
        alert.addTextField { (alertTextField) in
        alertTextField.placeholder = "Create new item"
        textField = alertTextField

        }
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    }
    


}

