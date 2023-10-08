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

final class LocalFactory {
    private func getJSONModel<T: Decodable>(_ modelType: T.Type, resource: String) throws -> T? {
        guard let file = Bundle.main.url(forResource: resource, withExtension: "json") else {
            return nil
        }
        
        let data = try Data(contentsOf: file)
        let model = try JSONDecoder().decode(modelType, from: data)
        return model
    }
}

extension LocalFactory: MovieFactory {
    var movies: Movies {
        do {
            guard let movies = try getJSONModel(Movies.self, resource: "movies") else {
                return []
            }
            return movies
        } catch {
            return []
        }
    }
}
