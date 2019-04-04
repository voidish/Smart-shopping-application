//
//  ProductCell.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var dscrLabel: UILabel!
    
    var product: Product!
    var vc: ProductsVC!
    
    @IBAction func addProductAction() {
        self.vc.addProductToMyList(product: product)
    }
    
}
