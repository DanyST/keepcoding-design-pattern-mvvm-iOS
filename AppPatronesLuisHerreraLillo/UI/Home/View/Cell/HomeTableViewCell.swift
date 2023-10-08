//
//  HomeTableViewCell.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homeImageView.layer.cornerRadius = 8.0
        homeImageView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        genreLabel.text = nil
        titleLabel.text = nil
        homeImageView.image = nil
    }
    
    func updateViews(model: HomeCellModel) {
        update(genre: model.genre)
        update(image: model.image)
        update(title: model.title)
    }
    
    private func update(genre: String?) {
        genreLabel.text = genre ?? ""
    }
    
    private func update(title: String?) {
        titleLabel.text = title ?? ""
    }
    
    private func update(image: String?) {
        guard let url = URL(string: image ?? "") else { return }
        homeImageView.setImage(for: url)
    }
}

extension HomeTableViewCell: ReusableView {}
