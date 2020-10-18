//
//  Configuracion.swift
//  BBVA
//
//  Created by Samuel Arturo Garrido Sánchez on 2020-10-17.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit

class Configuracion: UIViewController,UITableViewDataSource,UITableViewDelegate, HalfModalPresentable{
    
    
    let configuracion:[String] = ["Ir a la app BBVA","Sitio Web de BBVA","Configuración","Ofertas guardadas","Política de Privacidad","Compartir aplicación","Cerrar Sesión"]
    
    let imagenes:[String] = ["ir-bbva","sitio_web","config","bookmark","shield","share","exit"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        configuracion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell(style:UITableViewCell.CellStyle.default,reuseIdentifier:"celdaConfiguracionIdentifier")
            celda.imageView!.image = UIImage(named: imagenes[indexPath.row] )
            celda.textLabel?.text = configuracion[indexPath.row]
        
        return celda
    }
    
    
    @IBOutlet var tabla_config: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Más opciones"
        tabla_config.delegate = self
        tabla_config.dataSource = self

        // Do any additional setup after loading the view.
    }
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        if let delegate = navigationController?.transitioningDelegate as? HalfModalTransitioningDelegate {
            delegate.interactiveDismiss = false
        }
        
        dismiss(animated: true, completion: nil)
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
