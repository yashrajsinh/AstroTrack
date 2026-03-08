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
        setCordinates()
    }
    func setCordinates(){
        //Setting long and lati
        let lat =  37.7749
        let long = -122.4194
        
        //Adding our custom coordinates
        let coordinates = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        //Map annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        
        mapView.addAnnotation(annotation)
        
        //Center the map so coordinates are visible
        let region = MKCoordinateRegion(
            center: coordinates, span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
            )
        mapView.setRegion(region, animated: true)
        
    }

}

