//
//  CategoryDataCellProtocol.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 18/10/22.
//

import Foundation
import UIKit

protocol CategoryDataCellProtocol: UITableViewCell {
    func setup(_ data: CategoryData)
}
