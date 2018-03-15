//
//  TableViewController.swift
//  BetterKit_Example
//
//  Created by Nathan Jangula on 3/15/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import BetterKit

class TableViewController: UITableViewController {
    
    var sectionCount = Int.random % 3
    var rowCount = Int.random % 3

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(handlePullToRefresh), for: .valueChanged)
    }
    
    @objc func handlePullToRefresh() {
        reloadTable()
        tableView.refreshControl?.endRefreshing()
    }
    
    func reloadTable() {
        sectionCount = Int.random % 10
        rowCount = Int.random % 10
        tableView.reloadData(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
//        return Int.random % 3
        return sectionCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Int.random % 3
        return rowCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.backgroundColor = UIColor.random
        cell.textLabel?.text = "\(indexPath.section):\(indexPath.row)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reloadTable()
    }
}
