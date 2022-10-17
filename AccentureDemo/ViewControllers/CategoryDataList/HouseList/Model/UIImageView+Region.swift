//
//  UIImageView+Region.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 17/10/22.
//

import Foundation
import UIKit

enum Region: String {
    case north = "THE NORTH"
    case vale = "THE VALE"
    case riverlands = "THE RIVERLANDS"
    case ironIslands = "IRON ISLANDS"
    case westerlands = "THE WESTERLANDS"
    case reach = "THE REACH"
    case dorne = "DRONE"
    case stromlands = "THE STORMLANDS"
    
    var iconUrl: String {
        switch self {
        case .north:
            return "https://bit.ly/2Gcq0r4"
        case .vale:
            return "https://bit.ly/34FAvws"
        case .riverlands, .ironIslands:
            return "https://bit.ly/3kJrIiP"
        case .westerlands:
            return "https://bit.ly/2TAzjnO"
        case .reach:
            return "https://bit.ly/2HSCW5N"
        case .dorne:
            return "https://bit.ly/2HOcavT"
        case .stromlands:
            return "https://bit.ly/34F2sEC"
        }
    }
}

extension UIImageView {
    @discardableResult
    func setRegionImage(_ regionName: String) -> URLSessionDataTask?  {
        guard let region = Region(rawValue: regionName.uppercased()) else {
            self.image = nil
            return nil
        }
        return setImageFromUrl(region.iconUrl)
    }
}
