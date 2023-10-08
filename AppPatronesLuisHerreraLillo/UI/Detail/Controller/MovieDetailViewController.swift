//
//  MovieDetailViewController.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import UIKit

protocol MovieDetailViewProtocol: AnyObject {
    func updateViews(with detail: MovieDetail)
}

final class MovieDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    // MARK: - Properties
    private let viewModel: MovieDetailViewModelProtocol
    
    // MARK: - Initialization
    init(viewModel: MovieDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        configureNavigationBar()
        configureTextView()
        viewModel.onViewsLoaded()
    }
    
    private func configureTextView() {
        overviewTextView.isEditable = false
        overviewTextView.isSelectable = false
    }
    
    private func configureNavigationBar() {
        let image = UIImage(systemName: "chevron.backward.circle.fill")?
           .withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        navigationItem.leftBarButtonItem =  UIBarButtonItem(
            image: image,
            style: .plain,
            target: self,
            action: #selector(didTapNavigationButton)
        )
    }
    
    @objc
    private func didTapNavigationButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension MovieDetailViewController: MovieDetailViewProtocol {
    func updateViews(with detail: MovieDetail) {
        update(topImage: detail.backdropUrl)
        update(image: detail.posterUrl)
        update(rating: detail.voteAverage)
        update(title: detail.title)
        update(genre: detail.genre)
        update(overview: detail.overview)
    }
}

private extension MovieDetailViewController {
    func update(topImage: String?) {
        guard let url = URL(string: topImage ?? "") else { return }
        topImageView.setImage(for: url)
    }
    
    func update(image: String?) {
        guard let url = URL(string: image ?? "") else { return }
        imageView.setImage(for: url)
    }
    
    func update(title: String?) {
        titleLabel.text = title ?? ""
    }
    
    func update(rating: Double?) {
        ratingLabel.text = "\(rating ?? 0.0)"
    }
    
    func update(genre: String?) {
        genreLabel.text = genre ?? ""
    }
    
    func update(overview: String?) {
        overviewTextView.text = overview ?? ""
    }
}
