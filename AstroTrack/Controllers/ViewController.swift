//
//  ViewController.swift
//  AstroTrack
//
//  Created by Yashrajsinh Jadeja on 2026-03-08.
//

import UIKit
import MapKit



class ViewController: UIViewController {
    //MapView Outlet
    @IBOutlet weak var mapView : MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Calling maps methods to long and lati
      //  setCordinates()
        APIService.shared.fetchISSPosition { latitude,longitude in
            print(latitude,longitude)
        }
    }
    
    func setCordinates(){
    
    }

}

