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
    //ISS marker
    var issAnnotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        mapView.delegate = self
        mapView.selectAnnotation(issAnnotation, animated: true)
        //Fetch the API to load
        fetchISS()
        //Add Market to the map
        mapView.addAnnotation(issAnnotation)
        
        //Update every 5 seconds
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            self.fetchISS()
        }
        
    }
    
    func fetchISS(){
        APIService.shared.fetchISSPosition{latitude,longitude in
            DispatchQueue.main.async {
                let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                //Move the market
                UIView.animate(withDuration: 2) {
                    self.issAnnotation.coordinate = coordinate
                    self.issAnnotation.title = "ISS Satellite"
                }
                //Center the Map
                let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30))
                self.mapView.setRegion(region, animated: true)
            }
            
        }
    }

}
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        let identifier = "Satelite"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.image = UIImage(named: "satellite")
            annotationView?.frame.size = CGSize(width: 50, height: 50)
        }else{
            annotationView?.annotation = annotation
        }
        return annotationView
    }
}
