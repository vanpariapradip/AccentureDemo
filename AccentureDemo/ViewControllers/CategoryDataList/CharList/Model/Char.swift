//
//  Char.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 17/10/22.
//

import Foundation

//Character
struct Char: CategoryData {
    let id, name: String
    let gender: Gender
    let culture, born, died: String
    let titles, aliases: [String]
    let father, mother, spouse: String
    let allegiances: [String]
    let playedBy: [String]
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}
