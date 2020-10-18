//
//  Mapa.swift
//  BBVA
//
//  Created by Samuel Arturo Garrido Sánchez on 2020-10-16.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class Mapa: UIViewController,CLLocationManagerDelegate{
        var placesClient: GMSPlacesClient!
        var likeHoodList: GMSPlaceLikelihoodList?
      var markers = [GMSMarker]()
    
      func removerMarcadores(mapView: GMSMapView){
          for (index, _) in markers.enumerated() {
              self.markers[index].map = nil
          }
      }
    var locationManager = CLLocationManager()
      
      func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
          let locValue:CLLocationCoordinate2D = manager.location!.coordinate
          print("locations = \(locValue.latitude) \(locValue.longitude)")
      }
      
      
    @IBOutlet var mapView: GMSMapView!
    
      override func viewWillAppear(_ animated: Bool) {
          locationManager.delegate = self;
          locationManager.desiredAccuracy = kCLLocationAccuracyBest
          locationManager.requestAlwaysAuthorization()
          locationManager.requestWhenInUseAuthorization()
          locationManager.startUpdatingLocation()
      }
    
    
      override func loadView() {
          super.viewDidLoad()
          navigationController?.navigationBar.barStyle = .black
          locationManager.delegate = self;
          locationManager.desiredAccuracy = kCLLocationAccuracyBest
          locationManager.requestAlwaysAuthorization()
          locationManager.requestWhenInUseAuthorization()
          locationManager.startUpdatingLocation()
          
        let camera = GMSCameraPosition.camera(withLatitude: 17.967524, longitude: -92.940931, zoom: 18.0)
          mapView = GMSMapView(frame: CGRect.zero, camera: camera)
          self.mapView?.clear()
          

        // Initialize the location manager.
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self

    
        
        
        
        
          self.view = mapView
          self.navigationItem.title = "Localizaciones"
        
        //MARCADORES:
        let coordenadasdummys = [[17.967524,-92.940931],[17.965436, -92.938785],[17.966138, -92.939735],[17.966596, -92.941195],[17.966596, -92.941195],[17.967347, -92.941618],[17.965393, -92.940339]]
        for i in 0...coordenadasdummys.count-1{
            let position = CLLocationCoordinate2D(latitude: coordenadasdummys[i][0], longitude: coordenadasdummys[i][1])
            let marker = GMSMarker(position: position)
            marker.title = "Liverpool"
            marker.map = mapView
        }
        

      
    }
    
        /*
        Para la transición modal
        */
       var halfModalTransitioningDelegate: HalfModalTransitioningDelegate?
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           super.prepare(for: segue, sender: sender)
           
           self.halfModalTransitioningDelegate = HalfModalTransitioningDelegate(viewController: self, presentingViewController: segue.destination)
           
           segue.destination.modalPresentationStyle = .custom
           segue.destination.transitioningDelegate = self.halfModalTransitioningDelegate
       }
 
    
    
    
}


enum JSONError: String, Error {
    case NoData = "ERROR: Nada de data"
    case ConversionFailed = "ERROR: conversión de JSON fallida"
}

