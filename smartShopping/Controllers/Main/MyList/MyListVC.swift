//
//  MyListVC.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import UIKit
import AlamofireImage
class MyListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myList = Array<Product>()
    @IBOutlet var quantitySelectedLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var totalLabel: UILabel!
    
    // put new placeholder image from assests
    let placeholder = UIImage(named: "list")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cowntdown = self.myList.filter({ $0.shopId.elementsEqual("y6ssalsn6")})
        let newWorld = self.myList.filter({ $0.shopId.elementsEqual("7i9jnzypf")})
        self.myList.removeAll()
        self.myList.append(contentsOf: cowntdown)
        self.myList.append(contentsOf: newWorld)
        self.quantitySelectedLabel.text = String(self.myList.count)
        self.calculateTotal()
        // Do any additional setup after loading the view.
    }
    
    //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setTitle(title: "My List")
    }
    
    // the length of the array of products to create cells later in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myList.count
    }
    
    // Filling the table view to fill the elements
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MyProductCell") as! MyProductCell
        let p = myList[indexPath.row]
        cell.product = p
        cell.vc = self
        cell.productNameLabel.text = p.name
        if p.shopId.elementsEqual("y6ssalsn6") {
            cell.shopNameLabel.text = "Countodown"
            cell.shopNameLabel.textColor = #colorLiteral(red: 0.1656211615, green: 0.6442035437, blue: 0.05840028077, alpha: 1)
        } else {
            cell.shopNameLabel.text = "New World Metro"
            cell.shopNameLabel.textColor = UIColor.red
        }
        cell.priceLabel.text = p.normalPrice
        cell.quantityLabel.text = String(p.quantity)
        // load the imageUrl from the product with alamofireImage library
        if let urlImage = URL(string: p.urlImage) {
            cell.imageProduct.af_setImage(
                withURL: urlImage,
                placeholderImage: placeholder,
                filter: nil,
                imageTransition: .crossDissolve(0.2)
            )
        } else {
            cell.imageProduct.image = placeholder
        }
        return cell
    }
    
    // deleting
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.myList.remove(at: indexPath.row)
            self.quantitySelectedLabel.text = String(self.myList.count)
            self.calculateTotal()
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    
    func calculateTotal() {
        var total: Double = 0.0
        for p in self.myList {
            total = total + (Double(p.quantity) * Double(p.normalPrice)!)
        }
        self.totalLabel.text = String(format: "%.2f", total)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
