//
//  CustomAnnotationView.swift
//  AppName
//
//  Created by Redemax on 5/13/19.
//  Copyright © 2019 Alisher Altore. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotationView: MKAnnotationView {

    var solvedStatus: Bool = false {
        didSet {
            self.backgroundColor = solvedStatus ? UIColor(red: 103, green: 173, blue: 91) : UIColor.red
            print("Wooow")
        }
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = solvedStatus ? UIColor(red: 103, green: 173, blue: 91) : UIColor.red
        print("solvedStatus: \(solvedStatus)")
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
