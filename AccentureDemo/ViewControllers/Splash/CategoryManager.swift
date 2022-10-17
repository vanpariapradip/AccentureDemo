//
//  CategoryManager.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 16/10/22.
//

import Foundation

class CategoryManager {
    
    private lazy var client: CategoryClient = {
       return CategoryClient()
        
    }()
    
    private static var dataPath: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("categoryData")
            
    func isCategoryStored() -> Bool {
        return FileManager.default.fileExists(atPath: CategoryManager.dataPath.path)
    }
    
    func saveCategoryData(_ data: Data?) throws {
        try data?.write(to: CategoryManager.dataPath)
    }
    
    func getCategoryArray() -> [Category]? {
        if let data = try? Data(contentsOf: CategoryManager.dataPath) {
            return try? JSONDecoder().decode([Category].self, from: data)
        }
        return nil
    }
    
    func downloadCategory(_ completion: @escaping ( _ success: Bool, _ error: Error?) -> ()) {
        client.downloadCategoryList() { responseData, error in
            DispatchQueue.main.async {
                if let array = responseData {
                    let data = try? JSONEncoder().encode(array)
                    try? self.saveCategoryData(data)
                    completion(true, nil)
                } else {
                    completion(false, error)
                }
            }
        }
    }
}
