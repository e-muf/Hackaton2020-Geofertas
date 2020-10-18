//
//  Extras.swift
//  BBVA
//
//  Created by Samuel Arturo Garrido Sánchez on 2020-10-16.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit

class Notificaciones: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .black
        self.navigationItem.title = "Notificaciones"
        
        tablaNotificaciones.delegate = self
        tablaNotificaciones.dataSource = self
        
        
    }
    
    @IBOutlet var tablaNotificaciones: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tiendas.count
    }
    
    let tiendas = ["BBVA Seguros","Liverpool","Nissan","Inmobiliaria Villahermosa","BBVA Créditos"]
    
    let textos = ["BBVA pone en tus manos el mejor auto. Crédito preaprobado por $231,050.0","En liverpool te consentimos, pasa a nuestra tienda por descuentos","Nissan y BBVA se alian para ofecerte 0% comisión por apertura","Grupo Carso da descuentos del 10% de clientes BBVA","Te espera estas fechas un crédito preaprobado"]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //TODO: traer la infor de la respuesta del back
        let celda = tableView.dequeueReusableCell(withIdentifier: "CeldaOfertas") as! CeldaNotificacion
        celda.label_tienda.text = tiendas[indexPath.row]
        celda.label_nombre_oferta.text = textos[indexPath.row]
    
        celda.label_vigencia.text = "Vigencia: \(Int.random(in: 1...30)) de Noviembre"
        
        return celda
    }
    

    // Tamaño de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func consultarOfertas() {
        
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
