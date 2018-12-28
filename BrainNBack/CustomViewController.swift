//
//  CustomViewController.swift
//  BrainNBack
//
//  Created by AVARGUES1 on 28/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import UIKit

class CustomViewController: UITableViewController {
    
    fileprivate var items = [Statistique]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemCell")
    }
    
    func updateUI(items: [Statistique]) {
        self.items = items
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let statPartie = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        cell.updateUI(stat: statPartie)
        return cell
    }
    
}

// MARK: - UITableViewDataSource


    

