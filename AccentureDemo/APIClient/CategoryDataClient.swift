//
//  CategoryDataClient.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 17/10/22.
//

import Foundation

class CategoryDataClient: BaseClient {
    
    let type: CategoryData.Type
    
    init(_ type: CategoryData.Type) {
        self.type = type
        super.init()
    }
 
    func downloadCategoryData(_ path: String, _ completion: @escaping ([CategoryData]?, Error?) -> ()) {
        switch type {
        case is House.Type:
            downloadHouseData(path, completion)
        case is Book.Type:
            downloadBookData(path, completion)
        case is Char.Type:
            downloadCharacterData(path, completion)
        default:
            completion(nil, nil)
        }
    }
    private func downloadHouseData(_ path: String, _ completion: @escaping ([House]?, Error?) -> ()) {
        downloadData(path, completion)
    }
    func downloadCharacterData(_ path: String, _ completion: @escaping ([Char]?, Error?) -> ()) {
        downloadData(path, completion)
    }
    func downloadBookData(_ path: String, _ completion: @escaping ([Book]?, Error?) -> ()) {
        downloadData(path, completion)
    }
}
