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
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        genreLabel.text = nil
        titleLabel.text = nil
        homeImageView.image = nil
    }
    
    func updateViews() {
        update(genre: "Action")
        update(image: "")
        update(title: "Gran Turismo")
    }
    
    private func update(genre: String?) {
        genreLabel.text = genre ?? ""
    }
    
    private func update(title: String?) {
        titleLabel.text = title ?? ""
    }
    
    private func update(image: String?) {
        homeImageView.image = UIImage(systemName: "star")
    }
}

extension HomeTableViewCell: ReusableView {}
