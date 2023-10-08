//
//  HomeTableViewController.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func updateViews()
    func navigateToDetail(with movieDetail: MovieDetail)
}

final class HomeTableViewController: UITableViewController {
    // MARK: - Properties
    private let viewModel: HomeViewModelProtocol
    
    // MARK: - Initialization
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        setupTableView()
        registerCells()
        viewModel.onViewsLoaded()
    }
    
    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    private func registerCells() {
        let nib = UINib(nibName: "\(HomeTableViewCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
    }
}

// MARK: - Table view data source
extension HomeTableViewController {
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
        
        if let cellModel = viewModel.movieCellModel(at: indexPath.row) {
            cell.updateViews(model: cellModel)
        }
        
        return cell
    }
}

// MARK: - Table view delegate
extension HomeTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.onItemSelected(at: indexPath.row)
    }
}

// MARK: - HomeViewProtocol
extension HomeTableViewController: HomeViewProtocol {
    func updateViews() {
        tableView.reloadData()
    }
    
    func navigateToDetail(with movieDetail: MovieDetail) {
        let viewModel = MovieDetailViewModel(movieDetail: movieDetail)
        let nextVC = MovieDetailViewController(viewModel: viewModel)
        viewModel.viewDelegate = nextVC
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
