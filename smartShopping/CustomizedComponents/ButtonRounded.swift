//
//  ButtonRounded.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable class ButtonRounded: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
    }
    
    func refreshCorners(value: CGFloat) {
        self.layer.cornerRadius = value
        self.clipsToBounds = true
    }
}
