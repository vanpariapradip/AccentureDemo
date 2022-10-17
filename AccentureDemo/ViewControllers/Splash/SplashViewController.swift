//
//  SplashViewController.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 16/10/22.
//

import UIKit

class SplashViewController: UIViewController {

    var viewModel = SplashViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    private func setupViewModel() {
  
        viewModel.openCategoryView = {
            self.openCagegoryView()
        }
        viewModel.displayError = { errorMessage in
            self.displayError(errorMessage ?? "")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.viewModel.downloadCategoryIfRequired()
        }
    }
    
    private func displayError(_ message: String) {
        let retry = UIAlertAction.init(title: "Retry", style: .default) { _ in
            self.viewModel.retry()
        }
        
        let alert = UIAlertController.init(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(retry)
        
        present(alert, animated: true)
    }

    private func openCagegoryView() {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "CategoryEntryPoint")
        self.view.window?.rootViewController = controller
    }
}
