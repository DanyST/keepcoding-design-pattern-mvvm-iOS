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
    func movieCell(at index: Int) -> HomeCellModel?
    func onViewsLoaded()
    func onItemSelected(at index: Int)
}

final class HomeViewModel {
    weak var viewDelegate: HomeViewProtocol?
    
    private var viewData = Movies()
    
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
}

extension HomeViewModel: HomeViewModelProtocol {
    var title: String {
        "Discover Movies"
    }
    
    var dataCount: Int {
        viewData.count
    }
    
    func onItemSelected(at index: Int) {
        guard let data = movie(at: index) else {
            return
        }
        viewDelegate?.navigateToDetail(with: data)
    }
    
    func movieCell(at index: Int) -> HomeCellModel? {
        guard let movie = movie(at: index) else {
            return nil
        }
        var url = URL(string: Constants.imageBaseUrl)
        url?.append(path: ImageSize.w200.rawValue)
        url?.append(path: movie.posterPath)
        
        return HomeCellModel(
            title: movie.title,
            genre: movie.genreTypes?.first??.title,
            image: url?.absoluteString
        )
    }
    
    func onViewsLoaded() {
        loadData()
    }
}
