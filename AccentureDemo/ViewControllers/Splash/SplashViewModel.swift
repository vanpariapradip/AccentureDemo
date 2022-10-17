//
//  SplashViewModel.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 16/10/22.
//

import Foundation

class SplashViewModel {
    
    var openCategoryView : (() -> ()) = {}
    var displayError : ((String?) -> ()) = { _ in }

    private lazy var manager: CategoryManager = {
       return CategoryManager()
    }()
    
    func downloadCategoryIfRequired() {
        if manager.isCategoryStored() {
            openCategoryView()
        } else {
            downloadCategoryData()
        }
    }
    
    func retry() {
         downloadCategoryData()
    }
    
    private func downloadCategoryData() {
        manager.downloadCategory { success, error in
            if success {
                self.openCategoryView()
            } else {
                self.displayError(error?.localizedDescription)
            }
        }
    }
}
