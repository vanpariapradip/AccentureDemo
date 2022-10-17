//
//  CategoryClient.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 16/10/22.
//

import Foundation

class CategoryClient: BaseClient {
    func downloadCategoryList(_ completion: @escaping ([Category]?, Error?) -> ()) {
        downloadData("categories", completion)
    }
}
