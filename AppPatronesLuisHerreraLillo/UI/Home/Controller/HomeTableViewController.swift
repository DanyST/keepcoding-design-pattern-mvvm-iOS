//
//  HomeTableViewController.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import UIKit

class HomeTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Discover Movies"
        registerCells()
    }
    
    private func registerCells() {
        let nib = UINib(nibName: "\(HomeTableViewCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.updateViews()
        return cell
    }
}
