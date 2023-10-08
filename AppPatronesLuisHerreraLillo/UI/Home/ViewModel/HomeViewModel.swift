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
    func data(at index: Int) -> Movie?
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
}

extension HomeViewModel: HomeViewModelProtocol {
    var title: String {
        "Discover Movies"
    }
    
    var dataCount: Int {
        viewData.count
    }
    
    func onItemSelected(at index: Int) {
        guard let data = data(at: index) else {
            return
        }
        viewDelegate?.navigateToDetail(with: data)
    }
    
    func data(at index: Int) -> Movie? {
        guard index < viewData.count else {
            return nil
        }
        return viewData[index]
    }
    
    func onViewsLoaded() {
        loadData()
    }
}
