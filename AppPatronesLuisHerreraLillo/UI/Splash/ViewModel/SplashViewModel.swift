//
//  SplashViewModel.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import Foundation

protocol SplashViewModelProtocol {
    func onViewsLoaded()
}

final class SplashViewModel {
    // MARK: - Propeties
    weak var viewDelegate: SplashViewProtocol?
    
    // MARK: - Methods
    private func loadData() {
        viewDelegate?.setLoading(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [weak self] in
            self?.viewDelegate?.setLoading(false)
            self?.viewDelegate?.navigateToHome()
        }
    }
}

// MARK: - SplashViewModelProtocol
extension SplashViewModel: SplashViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }
}
