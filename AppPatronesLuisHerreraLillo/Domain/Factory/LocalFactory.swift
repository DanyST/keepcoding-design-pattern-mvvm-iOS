//
//  LocalFactory.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import Foundation

typealias Movies = [Movie]

protocol MovieFactory {
    var movies: Movies { get }
}

final class LocalFactory: MovieFactory {
    var movies: Movies {
        guard let file = Bundle.main.url(forResource: "movies", withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: file)
            let movies = try JSONDecoder().decode(Movies.self, from: data)
            return movies
        } catch {
            return []
        }
    }
}
