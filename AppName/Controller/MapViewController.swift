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
    private var selectedIndex = 0 {
        didSet {
            switch selectedIndex {
            case 0:
                fetchReportsOnMap(getSolvedReports)
            case 1:
                fetchReportsOnMap(getUnsolvedReports)
            case 2:
                fetchReportsOnMap(reports)
            default:
                break
            }
        }
    }
    
    // MARK: - Model
    
    var reports: [Report] = []
    private var getSolvedReports: [Report] {
        return reports.filter { $0.isSolved }
    }
    
    private var getUnsolvedReports: [Report] {
        return reports.filter { !$0.isSolved }
    }

    // MARK: - Storyboard
    
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func addReport(_ sender: UIButton) {
        print("Add Report")
    }
    @IBOutlet weak var segmentedControl: UISegmentedControl! 
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
       selectedIndex = sender.selectedSegmentIndex
    }
    
    // MARK: - Map
    
    private func fetchReportsOnMap(_ reports: [Report]) {
        let allAnnotations = self.mapView.annotations as! [CustomAnnotation]
        self.mapView.removeAnnotations(allAnnotations)
        for report in reports {
            let annotations = CustomAnnotation()
            annotations.coordinate = CLLocationCoordinate2D(latitude: report.latitude, longitude: report.longitude)
            annotations.isSolved = report.isSolved
            mapView.addAnnotation(annotations)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.showsCompass = true
        mapView.showsUserLocation = true
        
        // Request for a user's authorization for location services
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
        
        reports = [
            Report(imageURLs: [], title: "Мусор", description: "Уберите мусор"),
            Report(imageURLs: [], title: "Открытый люк", description: "Открытый люк"),
            Report(imageURLs: [], title: "Сломана качеля", description: "Ноги сломать можно"),
            Report(imageURLs: [], title: "Мусор", description: "Уберите мусор")
        ]

        reports[0].latitude = 43.241858
        reports[0].longitude = 76.890092
        reports[0].reportIsSolved()
        
        reports[1].latitude = 43.241827
        reports[1].longitude = 76.885114
        
        reports[2].latitude = 43.241358
        reports[2].longitude = 76.885887
        reports[0].reportIsSolved()
        
        
        reports[3].latitude = 43.240639
        reports[3].longitude = 76.884041
        
        fetchReportsOnMap(getSolvedReports)
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

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "My Marker"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        let annotation = annotation as! CustomAnnotation
        
        annotationView?.markerTintColor = annotation.isSolved ? UIColor(red: 103, green: 173, blue: 91) : UIColor.red
        return annotationView
    }
}

