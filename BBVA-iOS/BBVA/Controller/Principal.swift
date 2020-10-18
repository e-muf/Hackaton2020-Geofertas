//
//  Principal.swift
//  BBVA
//
//  Created by Samuel Arturo Garrido Sánchez on 2020-10-16.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit
import UserNotifications

class Principal: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UNUserNotificationCenterDelegate {
    
    @IBOutlet var colleccionOfertas: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    

    @IBAction func StartButton(_ sender: Any) {
        setNotification()
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "CeldaOferta", for: indexPath) as! CeldaOferta
        
        celda.nombreOferta.text = "Tenemos las mejores ofertas disponibles por BBVA Puntos"
       
        celda.tienda_Oferta.text = "Liverpool"
        celda.vigencia_Oferta.text = "Vigencia: 3 de Noviembre"
        
        celda.imagen_Oferta.image = UIImage(named: "nasa-home")
        
        
        //Chuleada
        
        celda.contentView.layer.cornerRadius = 10
        celda.contentView.layer.borderWidth = 0.5
        celda.contentView.layer.borderColor = UIColor.black.cgColor
        celda.contentView.layer.masksToBounds = false
        
        celda.layer.shadowColor = UIColor.gray.cgColor
        celda.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        celda.layer.cornerRadius = 10
        celda.layer.shadowOpacity = 1.0
        celda.layer.masksToBounds = false
        celda.layer.shadowPath = UIBezierPath(roundedRect: celda.bounds, cornerRadius: celda.contentView.layer.cornerRadius).cgPath
        
        
        return celda
    }
    
    
    
    func configuracionInicial() {
        navigationController?.navigationBar.barStyle = .black
        self.navigationItem.title = "Principal"
        

    }

    
        

    override func viewDidLoad() {
        super.viewDidLoad()
        configuracionInicial()
        
        colleccionOfertas.delegate = self
        colleccionOfertas.dataSource = self
        
        
        
        // Do any additional setup after loading the view.
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
    
    
     /*Envío de notificaciones normales*/
    func setNotification() {
        let content = UNMutableNotificationContent()
        content.title = "BBVA pone en tus manos el mejor auto"
        content.subtitle = "Adquiere un crédito por $231,050.00 preaprobado para estrenar auto"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)

        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { (error) in
            print(error?.localizedDescription ?? "")
        }

    }
    
}
