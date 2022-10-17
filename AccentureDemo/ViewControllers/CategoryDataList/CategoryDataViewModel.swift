//
//  CategoryDataViewModel.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 17/10/22.
//

import Foundation
import UIKit

class CategoryDataViewModel {
   
    let category: Category
    
    var reloadView : (() -> ()) = {}
    var displayError : ((String?) -> ()) = { _ in }
    var startProcess : (() -> ()) = {}
    var endProcess : (() -> ()) = {}
    
    private let client : CategoryDataClient?
    private(set) var categoryDataList: [CategoryData]! = [] {
        didSet {
            self.reloadView()
        }
    }
    
    init(_ category: Category) {
        self.category = category
        guard let type = category.categoryModelClass else {
            self.client = nil
            return
        }
        self.client = CategoryDataClient(type)
    }
    
    func title() -> String {
        return category.categoryName
    }
    
    func getData() {
        guard let client = self.client else {
            return
        }
        startProcess()
        client.downloadCategoryData(category.endPoint) { responseData, error in
            DispatchQueue.main.async {
                self.endProcess()
                if let data = responseData {
                    self.categoryDataList = data
                } else {
                    self.categoryDataList = []
                    self.displayError(error?.localizedDescription)
                }
            }
        }
    }
    
    func numberOfRows() -> Int {
        return categoryDataList.count
    }
    
    func registerCells(_ tableView: UITableView) {
        tableView.register(UINib.init(nibName: category.cellNibName, bundle: Bundle.main), forCellReuseIdentifier: category.cellNibName)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CategoryDataCellProtocol? {
        let data = categoryDataList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: category.cellNibName, for: indexPath) as? CategoryDataCellProtocol
        cell?.setup(data)
        cell?.selectionStyle = .none
        return cell
    }
}
