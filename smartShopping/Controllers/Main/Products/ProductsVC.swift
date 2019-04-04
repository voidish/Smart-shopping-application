//
//  MyListsVC.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import UIKit
import AlamofireImage
class ProductsVC: UIViewController, UICollectionViewDataSource,
                                    UICollectionViewDelegate, UISearchBarDelegate {
    

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var collectionView: UICollectionView!
    var products = Array<Product>()
    var currentlistProducts = Array<Product>()
    
    var myList = Array<Product>()
    
    @IBOutlet var quantitySelectedLabel: UILabel!
    // placeholder image from assests
    let placeholder = UIImage(named: "list")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadProducts()
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setTitle(title: "Products")
    }
    
    func loadProducts() {
        Hud.showProgress()
        RemoteManager().getProducts { (error, products) in
            if error == nil {
                // set the products from the cloud to the local variable products
                let shuffleProducts = products!.shuffled()
                self.products = shuffleProducts
                self.currentlistProducts = shuffleProducts
                // notify to the collectionView to refresh the new data
                self.collectionView.reloadData()
                Hud.hide()
            } else {
                let message = error?.userInfo["message"] as! String
                Hud.showMessage(message: message)
            }
        }
    }

    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.currentlistProducts.count
    } 
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath as IndexPath) as! ProductCell
        // getting each product from the array of products
        let p = self.currentlistProducts[indexPath.row]
        cell.product = p
        // sending the instance from MyListsVC
        cell.vc = self
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.priceLabel.text = "$" + p.normalPrice
        cell.dscrLabel.text = p.name
        
        if p.shopId.elementsEqual("y6ssalsn6") {
            cell.shopNameLabel.text = "Countodown"
            cell.shopNameLabel.textColor = #colorLiteral(red: 0.1656211615, green: 0.6442035437, blue: 0.05840028077, alpha: 1)
        } else {
            cell.shopNameLabel.text = "New World Metro"
            cell.shopNameLabel.textColor = UIColor.red
        }
        
        // load the imageUrl from the product with alamofireImage library
        if let urlImage = URL(string: p.urlImage) {
            cell.image.af_setImage(
                withURL: urlImage,
                placeholderImage: placeholder,
                filter: nil,
                imageTransition: .crossDissolve(0.2)
            )
        } else {
            cell.image.image = placeholder
        }
        return cell
    }
    
    // method called from addProductAction() in ProductCell(item collectionView)
    func addProductToMyList(product: Product) {
        self.myList.append(product)
        self.quantitySelectedLabel.text = String(self.myList.count)
    }
    
    // Action Button green on the bottom posotion
    @IBAction func goToMyListAction() {
        if self.myList.count != 0 {
            self.performSegue(withIdentifier: "MyListVC", sender: self)
        }
    }
    
    // Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentlistProducts = products.filter({ product -> Bool in
            
            if searchText.isEmpty { return true }
            return product.name.lowercased().contains(searchText.lowercased()) ||
                product.normalPrice.lowercased().contains(searchText.lowercased())
            
        })
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.searchBar.resignFirstResponder()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "MyListVC" {
            let svc = segue.destination as! MyListVC
            svc.myList = self.myList
        }
        
    }
   

}
