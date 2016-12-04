//
//  ViewController.swift
//  trytodo
//
//  Created by Vina Melody on 4/12/16.
//  Copyright © 2016 Vina Rianti. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    
    var tasks : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tasks.append("Top up my ezlink")
        self.tasks.append("Pay phone bill")
        self.tasks.append("Buy bread for breakfast")
        
        navigationItem.title = "My Todo List"
        
        tableView.register(TaskCell.self, forCellReuseIdentifier: cellId)
        
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(handleAdd))
        navigationItem.rightBarButtonItem = addButton
        
    }
    
    func handleAdd() {
        
        let alertController = UIAlertController(title: "Add New Task", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        let saveAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.default, handler:
            { action -> Void in
                
                let taskNameTextField = (alertController.textFields?[0])! as UITextField
                self.tasks.append(taskNameTextField.text!)
                self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (action) -> Void in
            
        }
        
        alertController.addTextField { (textfield: UITextField) in
            textfield.placeholder = "Task name"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TaskCell
        
        cell.taskLabel.text = self.tasks[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.left)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Done and Delete"
    }
}

class TaskCell: UITableViewCell {
    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.text = "My task"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    
    func setupViews() {
        
        addSubview(taskLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : taskLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : taskLabel]))
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

