//
//  HomeViewModel.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import Foundation

protocol HomeViewModelProtocol {
    var title: String { get }
    var dataCount: Int { get }
    func movieCellModel(at index: Int) -> HomeCellModel?
    func onViewsLoaded()
    func onItemSelected(at index: Int)
}

final class HomeViewModel {
    // MARK: - Properties
    weak var viewDelegate: HomeViewProtocol?
    private var viewData = Movies()
    
    // MARK: - Private Methods
    private func loadData() {
        viewData = MovieRepository.local.movies
        viewDelegate?.updateViews()
    }
    
    private func movie(at index: Int) -> Movie? {
        guard index < viewData.count else {
            return nil
        }
        return viewData[index]
    }
    
    private func genre(at movie: Movie) -> String? {
        let genre = movie.genreTypes?
            .compactMap { $0?.title }
            .joined(separator: ", ")
        
        return genre
    }
    
    private func sizeString(by imageSize: ImageSize) -> String {
        switch imageSize {
        case let .poster(posterSize):
            return posterSize.rawValue
        case let .backdrop(backgropSize):
            return backgropSize.rawValue
        }
    }
    
    private func imageUrl(at path: String, size: ImageSize) -> String? {
        let sizeString = sizeString(by: size)
        var imageUrl = URL(string: Constants.imageBaseUrl)
        imageUrl?.append(path: sizeString)
        imageUrl?.append(path: path)
        return imageUrl?.absoluteString
    }
}

// MARK: - HomeViewModelProtocol
extension HomeViewModel: HomeViewModelProtocol {
    var title: String {
        "Discover Movies"
    }
    
    var dataCount: Int {
        viewData.count
    }
    
    func onItemSelected(at index: Int) {
        guard let movie = movie(at: index) else {
            return
        }
        let movieDetail = MovieDetail(
            title: movie.title,
            genre: genre(at: movie),
            overview: movie.overview,
            posterUrl: imageUrl(at: movie.posterPath, size: .poster(.w185)),
            backdropUrl: imageUrl(at: movie.backdropPath, size: .backdrop(.w780)),
            releaseDate: movie.releaseDate,
            voteAverage: movie.voteAverage
        )
        viewDelegate?.navigateToDetail(with: movieDetail)
    }
    
    func movieCellModel(at index: Int) -> HomeCellModel? {
        guard let movie = movie(at: index) else {
            return nil
        }    
        return HomeCellModel(
            title: movie.title,
            genre: genre(at: movie),
            image: imageUrl(at: movie.posterPath, size: .poster(.w185))
        )
    }
    
    func onViewsLoaded() {
        loadData()
    }
}
