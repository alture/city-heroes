//
//  ViewController.swift
//  AppName
//
//  Created by Redemax on 5/12/19.
//  Copyright © 2019 Alisher Altore. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    // MARK: - Storyboard
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func addReport(_ sender: UIButton) {
        print("Add Report")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.showsScale = true
    }

}

