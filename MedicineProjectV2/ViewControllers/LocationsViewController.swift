//
//  LocationListViewController.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
import MapKit
protocol LocationViewProtocol{
    
}
class LocationsViewController: UIViewController {
    var presenter: LocationsPresenterProtocol!
    var configurator: LocationsConfiguratorProtocol = LocationsConfigurator()
    var locations: [LocationStructure]!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        locations = presenter.getAllLocations()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        guard let name = nameTextField.text else { return }
        guard let longitude = Double(longitudeTextField.text!) else { return }
        guard let latitude = Double(latitudeTextField.text!) else { return }
        presenter.addLocation(name: name,
                              latitude: latitude,
                              longitude: longitude)
    }
    
}
extension LocationsViewController: UITableViewDelegate{
    
}

extension LocationsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let location = locations[indexPath.row]
        cell?.textLabel?.text = location.name
        return cell!
    }
}

