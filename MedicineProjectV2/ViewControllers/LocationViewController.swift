//
//  LocationViewController.swift
//  MedicineProjectV2
//
//  Created by Saparbek . on 2/12/21.
//  Copyright © 2021 w2. All rights reserved.
//

import UIKit
import MapKit
class LocationViewController: UIViewController{
    var locationsViewController: LocationsViewController!
    var presenter: LocationPresenterProtocol!
    var configurator: LocationConfiguratorProtocol = LocationConfigurator()
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    @IBAction func saveLocationButtonPressed(_ sender: Any) {
        let latittude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        let location = LocationStructure(name: "Безымянный", longitude: longitude, latitude: latittude)
        locationsViewController.newLocation = location
        
        presenter.returnToLocations()
    }
}

extension LocationViewController: MKMapViewDelegate{
    
}
