//
//  MapViewController.swift
//  AppName
//
//  Created by Redemax on 5/12/19.
//  Copyright © 2019 Alisher Altore. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    // MARK: - Model
    
    var myReports = [Report]()
    var allReports = [Report]()
    
    var getSolvedReports: [Report] {
        return allReports.filter { $0.isSolved }
    }
    
    var getUnsolvedReports: [Report] {
        return allReports.filter { !$0.isSolved }
    }

    // MARK: - Storyboard
    
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func addReport(_ sender: UIButton) {
        print("Add Report")
    }
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        if let selectedTitle = sender.titleForSegment(at: selectedIndex) {
            print(selectedTitle)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.showsScale = true
        mapView.showsCompass = true
        
        // Request for a user's authorization for location services
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            mapView.showsUserLocation = true
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

extension MapViewController: MKMapViewDelegate {
    
}
