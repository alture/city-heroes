//
//  CustomAnnotation.swift
//  AppName
//
//  Created by Redemax on 5/13/19.
//  Copyright © 2019 Alisher Altore. All rights reserved.
//

import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var isSolved = false
    
    override init() {
        self.coordinate = CLLocationCoordinate2D()
        self.title = nil
        self.isSolved = false
    }
}
