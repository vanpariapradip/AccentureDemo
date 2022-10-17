//
//  CategoryDataTableViewController.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 17/10/22.
//

import UIKit

class CategoryDataTableViewController: UITableViewController {

    let viewModel: CategoryDataViewModel!
    
     init(_ categoy: Category) {
         self.viewModel = CategoryDataViewModel(categoy)
         super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        self.clearsSelectionOnViewWillAppear = false
    }
    
    private func setupViewModel() {
        self.title = viewModel.title()
        viewModel.registerCells(tableView)
        viewModel.startProcess = {
            self.tableView.showLoader()
        }
        viewModel.endProcess = {
            self.tableView.hideLoader()
        }
        viewModel.reloadView = {
            self.tableView.reloadData()
        }
        viewModel.displayError = { errorMessage in
            self.displayError(errorMessage ?? "")
        }
        viewModel.getData()
    }
    
    private func displayError(_ message: String) {
        let retry = UIAlertAction.init(title: "OK", style: .default)
        let alert = UIAlertController.init(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(retry)
        
        present(alert, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.tableView(tableView, cellForRowAt: indexPath) ?? UITableViewCell()
    }
}
