//
//  Loader.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 18/10/22.
//

import Foundation
import UIKit

protocol ViewLoader {
    func showLoader()
    func hideLoader()
}

extension UIView: ViewLoader {
    
    func showLoader() {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        self.addSubview(spinner)
        self.bringSubviewToFront(spinner)
        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        spinner.tag = 9999
    }
    
    func hideLoader() {
        if let spinner = self.viewWithTag(9999) as? UIActivityIndicatorView {
            spinner.stopAnimating()
            spinner.removeFromSuperview()
        }
    }
}
