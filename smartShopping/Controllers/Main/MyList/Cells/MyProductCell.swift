//
//  MyProductCell.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import UIKit

class MyProductCell: UITableViewCell {

    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var product: Product!
    var vc: MyListVC!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func minusAction() {
        if self.product.quantity != 0 {
            self.product.quantity = self.product.quantity - 1
            self.quantityLabel.text = String(self.product.quantity)
            self.vc.calculateTotal()
        }
    }
    
    @IBAction func plusAction() {
        self.product.quantity = self.product.quantity + 1
        self.quantityLabel.text = String(self.product.quantity)
        // Calling a method form VC
        self.vc.calculateTotal()
    }
    
}
