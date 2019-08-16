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
    
    let defaults = UserDefaults.standard

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
    }
    
    
    // the three datasource methods:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //<- decides how many rows
        return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // <-> creates the cell for the tableview
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // <- what happens when you select a row.
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            }
        
        
        tableView.deselectRow(at: indexPath, animated: true) // <- so there is a smooth animation.
        
        }
    
    
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) { // <- what happens when you press the add button
        
        var textField = UITextField()
        
        
        // you write your todolist item here
        let alert = UIAlertController(title: "Add new Todolist item", message: "", preferredStyle: .alert)
        
        
        // the button you press when you are done writing your todolist message
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in

            
            self.itemArray.append(textField.text ?? "Be a kinder person") //<- i set a default value... i know not the most fancy solution ever but so what i hope to annoy some people with my over-cheesiness
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            // the "magic" method
            self.tableView.reloadData()
        }
        
        
        alert.addTextField { (alertTextField) in
        alertTextField.placeholder = "Create new item"
        textField = alertTextField //<- because this has a pretty limited scope.

        }
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    }
    


}

