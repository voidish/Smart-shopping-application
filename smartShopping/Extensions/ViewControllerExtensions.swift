//
//  ViewControllerExtensions.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func setTitle(title: String) {
        self.navigationItem.title = title
    }
    
    
    // reconizer when user tap in other side from view, Change or hide the keyboard
    func hideKeyboard() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:))))
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        self.view.resignFirstResponder()
    }
}
