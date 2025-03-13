//
//  Heroes.swift
//  DragonBall
//
//  Created by Jan Petrina on 13/03/2025.
//

import Foundation

struct Hero: Codable, Equatable {
    let id: String
    let name: String
    let favorite: Bool
    let photo: String
    let description: String
}
