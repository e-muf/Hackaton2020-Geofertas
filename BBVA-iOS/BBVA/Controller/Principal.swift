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
        return ofertantes.count
    }
    
    

    @IBAction func StartButton(_ sender: Any) {
        setNotification()
    }
    
    let ofertantes = ["BBVA Créditos","BBVA - Liverpool","Sears","Liverpool","Nissan"]
    let textosOfertas = ["BBVA pone a tu disposición un crédito preaprobado para que estrenes auto","Con tarjeta Gold podrás acceder a mejores precios en Liverpool","Aprovecha las promociones de 40% de descuento pagando con tarjetas BBVA en Sears","En Liverpool amamos a los clientes de BBVA, les bonificamos 10% de su compra en puntos","Nissan Villahermosa: clientes BBVA con 0% comisión por apertura"]
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "CeldaOferta", for: indexPath) as! CeldaOferta
        
        celda.nombreOferta.text = textosOfertas[indexPath.row]
       
        celda.tienda_Oferta.text = ofertantes[indexPath.row]
        celda.vigencia_Oferta.text = "Vigencia: \(Int.random(in: 2..<30)) de Noviembre"
        
        celda.imagen_Oferta.image = UIImage(named: "ofertas\(indexPath.row)")
        
        
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
