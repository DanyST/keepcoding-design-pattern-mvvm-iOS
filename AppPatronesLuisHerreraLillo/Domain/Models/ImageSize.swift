//
//  ImageSize.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import Foundation

enum PosterImageSize: String {
    case w92
    case w154
    case w185
    case w32
    case w500
    case w780
    case original
}

enum BackDropImageSize: String {
    case w300
    case w780
    case w1280
    case original
}

enum ImageSize {
    case poster(PosterImageSize)
    case backdrop(BackDropImageSize)
}
