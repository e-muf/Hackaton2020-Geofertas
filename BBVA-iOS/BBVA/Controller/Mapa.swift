//
//  Mapa.swift
//  BBVA
//
//  Created by Samuel Arturo Garrido Sánchez on 2020-10-16.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit
import GoogleMaps

class Mapa: UIViewController,CLLocationManagerDelegate{
    
      var markers = [GMSMarker]()
    
      func removerMarcadores(mapView: GMSMapView){
          for (index, _) in markers.enumerated() {
              self.markers[index].map = nil
          }
      }
      
      func actualizarPosicionLocal(puntoB:String){
          locationManager.requestAlwaysAuthorization()
          locationManager.startUpdatingLocation()
          
        /*
          guard let url = URL(string: urlString) else {
              print("No se pudo acceder al URL")
              return
          }
        
          let urlRequest = URLRequest(url: url)
          let config = URLSessionConfiguration.default
          let session = URLSession(configuration: config)
        
    
          let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
              do {
                  guard let data = data else {
                      throw JSONError.NoData
                  }
                  guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
                      throw JSONError.ConversionFailed
                  }
                  if let array = json["routes"] as? NSArray {
                      if let routes = array[0] as? NSDictionary{
                          if let overview_polyline = routes["overview_polyline"] as? NSDictionary{
                              if let points = overview_polyline["points"] as? String{
                                  print(points)
                                  DispatchQueue.main.async {
                                      // mostrar polinomio
                                      let path = GMSPath(fromEncodedPath:points)
                                      let polyline = GMSPolyline(path:path)
                                      polyline.strokeWidth = 5
                                      polyline.strokeColor = UIColor.white
                                      polyline.map = self.mapView
                                  }
                              }
                          }
                      }
                  }
              } catch let error as JSONError {
                  print(error.rawValue)
              } catch let error as NSError {
                  print(error.debugDescription)
              }
              
          })
          task.resume()
        */
          //pásame latitud y longitud
          
          
           let position = CLLocationCoordinate2D(latitude: 17.967524, longitude: -92.940931)
           let marker = GMSMarker(position: position)
           marker.title = "Liverpool"
           marker.map = mapView
        
      }
      
      
      
      
      let locationManager = CLLocationManager()
      
      func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
          let locValue:CLLocationCoordinate2D = manager.location!.coordinate
          print("locations = \(locValue.latitude) \(locValue.longitude)")
          actualizarPosicionLocal(puntoB: "\(locValue.latitude),\(locValue.longitude)")
          
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
          
        let camera = GMSCameraPosition.camera(withLatitude: 18.00702, longitude: -92.93423, zoom: 10.0)
          mapView = GMSMapView(frame: CGRect.zero, camera: camera)
          self.mapView?.clear()
          do {
              if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                  mapView!.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
              } else {
                  NSLog("No se abrió el diseño")
              }
          } catch {
              NSLog("Salió mal. \(error)")
          }
        
          self.view = mapView
          
          self.navigationItem.title = "Localizaciones"
          let position = CLLocationCoordinate2D(latitude: 17.967524, longitude: -92.940931)
          let marker = GMSMarker(position: position)
          marker.title = "Liverpool"
          marker.map = mapView
      
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

