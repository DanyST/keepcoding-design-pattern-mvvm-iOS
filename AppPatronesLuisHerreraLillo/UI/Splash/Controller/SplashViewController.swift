//
//  SplashViewController.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import UIKit

protocol SplashViewProtocol: AnyObject {
    func setLoading(_ show: Bool)
    func navigateToHome()
}

final class SplashViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties
    private let viewModel: SplashViewModelProtocol
    
    // MARK: - Initialization
    init(viewModel: SplashViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        viewModel.onViewsLoaded()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator.stopAnimating()
    }
}

// MARK: - SplashViewProtocol
extension SplashViewController: SplashViewProtocol {
    func navigateToHome() {
        let viewModel = HomeViewModel()
        let nextVC = HomeTableViewController(viewModel: viewModel)
        viewModel.viewDelegate = nextVC
        navigationController?.setViewControllers([nextVC], animated: true)
    }
    
    func setLoading(_ show: Bool) {
        switch show {
        case true where !activityIndicator.isAnimating:
            activityIndicator.startAnimating()
        case false where activityIndicator.isAnimating:
            activityIndicator.stopAnimating()
        default: break
        }
    }
}
