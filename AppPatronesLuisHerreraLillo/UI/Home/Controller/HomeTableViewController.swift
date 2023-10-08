//
//  HomeTableViewController.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func updateViews()
    func navigateToDetail(with movie: Movie)
}

final class HomeTableViewController: UITableViewController {
    
    private let viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        registerCells()
        viewModel.onViewsLoaded()
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
        return viewModel.dataCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        if let data = viewModel.data(at: indexPath.row) {
            cell.updateViews(model: HomeCellModel(title: data.title, genre: data.genreTypes?.first??.title, image: data.posterPath))
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.onItemSelected(at: indexPath.row)
    }
}

extension HomeTableViewController: HomeViewProtocol {
    func updateViews() {
        tableView.reloadData()
    }
    
    func navigateToDetail(with movie: Movie) {
        print("navigateToDetail: \(movie.title)")
    }
}
