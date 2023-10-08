//
//  Movie.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let genreTypes: [MovieGenre?]?
    let originalLanguage: OriginalLanguage
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let backdropPath: String
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case genreTypes = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguage: String, Decodable {
    case en = "en"
    case es = "es"
}
