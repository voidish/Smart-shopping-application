//
//  LocationVC.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import UIKit
import GoogleMaps
class LocationVC: UIViewController {

    var shops = Array<Shop>()
    var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setTitle(title: "Shops on map")
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -36.8486838 at zoom level 10.
        let camera = GMSCameraPosition.camera(withLatitude: -36.8486838, longitude: 174.7624962, zoom: 14)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        view = mapView
        
        // Creates a marker in the center of the map.
        loadMarkers()
    }

    func loadMarkers() {
        Hud.showProgress()
        RemoteManager().getShops { (error, shops) in
            if error == nil {
                self.shops = shops!
                self.createMarkers()
                Hud.hide()
            } else {
                let message = error?.userInfo["message"] as! String
                Hud.showMessage(message: message)
            }
        }
    }
    
    
    func createMarkers() {
        for s in shops {
            for b in s.branches {
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: b.latitude, longitude: b.longitude)
                marker.title = s.name
                marker.snippet = b.name
                marker.map = self.mapView
            }
        }
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
