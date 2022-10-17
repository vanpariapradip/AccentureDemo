//
//  Category.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 16/10/22.
//

import Foundation
import UIKit

struct Category: Codable {
    let categoryName: String
    let type: Int

    enum CodingKeys: String, CodingKey {
        case categoryName = "category_name"
        case type
    }
}

enum CategoryName: String {
    case books = "Books"
    case houses = "Houses"
    case characters = "Characters"
    
}

extension Category {
    
    var endPoint: String {
        guard let category = CategoryName(rawValue: self.categoryName) else {
            return ""
        }
        switch category {
        case .books:
            return "list/1"
        case .houses:
            return "list/2"
        case .characters:
            return "list/3"
        }
    }
    
    var categoryModelClass: CategoryData.Type? {
        guard let category = CategoryName(rawValue: self.categoryName) else {
            return nil
        }

        switch category {
        case .books:
            return Book.self
        case .houses:
            return House.self
        case .characters:
            return Char.self
        }
    }
    
    var cellNibName: String {
        
        guard let category = CategoryName(rawValue: self.categoryName) else {
            return ""
        }

        switch category {
        case .books:
            return "BookTableViewCell"
        case .houses:
            return "HouseTableViewCell"
        case .characters:
            return "CharacterTableViewCell"
        }
    }
}
