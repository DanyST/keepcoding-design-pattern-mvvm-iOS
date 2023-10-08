//
//  ReusableView.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 08-10-23.
//

import UIKit

protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
