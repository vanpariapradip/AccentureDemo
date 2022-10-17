//
//  CategoryListViewModel.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 16/10/22.
//

import Foundation
import UIKit

class CategoryListViewModel {
    
    var openDataViewController : ((Category) -> ()) = { _ in }

    private let categories: [Category]! = {
        return CategoryManager().getCategoryArray()?.sorted(by: { $0.categoryName < $1.categoryName }) ?? []
    }()
    
    func title() -> String {
        return "Category List"
    }
    
    func numberOfRows() -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = category.categoryName
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDataViewController(categories[indexPath.row])
    }
}
