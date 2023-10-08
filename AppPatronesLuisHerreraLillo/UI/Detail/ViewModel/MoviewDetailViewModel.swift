//
//  MoviewDetailViewModel.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import Foundation

protocol MovieDetailViewModelProtocol {
    func onViewsLoaded()
}

final class MovieDetailViewModel {
    // MARK: - Properties
    private let movieDetail: MovieDetail
    weak var viewDelegate: MovieDetailViewProtocol?
    
    // MARK: - Initialization
    init(movieDetail: MovieDetail) {
        self.movieDetail = movieDetail
    }
    
    // MARK: - Private Methods
    private func loadData() {
        viewDelegate?.updateViews(with: movieDetail)
    }
}

// MARK: - MovieDetailViewModelProtocol
extension MovieDetailViewModel: MovieDetailViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }
}
