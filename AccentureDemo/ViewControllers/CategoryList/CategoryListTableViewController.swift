//
//  CategoryListTableViewController.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 16/10/22.
//

import UIKit

class CategoryListTableViewController: UITableViewController {

    private let viewModel = CategoryListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel.openDataViewController = { category in
            self.navigationItem.backBarButtonItem = UIBarButtonItem()
            let dataViewController = CategoryDataTableViewController(category)
            self.navigationController?.pushViewController(dataViewController, animated: true)
        }
        self.title = viewModel.title()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.tableView(tableView, cellForRowAt: indexPath)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.tableView(tableView, didSelectRowAt: indexPath)
    }
}
