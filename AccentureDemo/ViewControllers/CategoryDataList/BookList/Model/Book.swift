//
//  Book.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 17/10/22.
//

import Foundation

struct Book: CategoryData {
    let name, isbn: String
    let authors: [String]
    let numberOfPages: Int
    let publisher, country, mediaType, released: String
}
