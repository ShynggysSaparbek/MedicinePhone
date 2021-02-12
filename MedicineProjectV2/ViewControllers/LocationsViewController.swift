//
//  LocationListViewController.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
import MapKit
class LocationsViewController: UIViewController {
    var presenter: LocationsPresenterProtocol!
    var configurator: LocationsConfiguratorProtocol = LocationsConfigurator()
    var locations: [LocationStructure]!
    var newLocation: LocationStructure?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        locations = presenter.getAllLocations()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectLocationButtonPressed(_ sender: Any) {
        presenter.moveToSelectLocation()
    }
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let name = nameTextField.text else { return }
        guard var location = newLocation else {
            return
        }
        location.name = name
        
        presenter.addLocation(location: location)
        locations.append(location)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "selectLocation"){
            let vc = segue.destination as! LocationViewController
            vc.locationsViewController = self
        }
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

