//
//  MoviewDetailViewModel.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import Foundation

protocol MovieDetailViewModelProtocol {
    var title: String { get }
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
    
    private func loadData() {
        viewDelegate?.updateViews(with: movieDetail)
    }
}

extension MovieDetailViewModel: MovieDetailViewModelProtocol {
    var title: String {
        movieDetail.title
    }
    
    func onViewsLoaded() {
        loadData()
    }
}
