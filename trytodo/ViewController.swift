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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "My Todo List"
        
        tableView.register(TaskCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TaskCell
        return cell
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

