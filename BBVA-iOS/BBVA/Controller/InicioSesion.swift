//
//  InicioSesion.swift
//  BBVA
//
//  Created by Samuel Arturo Garrido Sánchez on 2020-10-17.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit

class InicioSesion: UIViewController {
    
    //Elementos de UI
    
    @IBOutlet var logo_bbva_inicio: UIImageView!
    @IBOutlet var imagen_bienvenida: UIImageView!
    @IBOutlet var saludoLabel: UILabel!
    @IBOutlet var nombreCliente_Label: UILabel!
    @IBOutlet var numTelefono_Label: UITextField!
    @IBOutlet var contrasena_Label: UITextField!
    @IBOutlet var boton_ingresar: UIButton!
    @IBOutlet var boton_no_usuario: UIButton!
    
    @IBAction func usar_no_cliente(_ sender: UIButton) {
        
        
    }
    
    
    
    
    @IBAction func iniciarSesion_action(_ sender: UIButton) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuracionInicial()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        hacerGradiente()
        super.viewWillAppear(animated)
    }
    
    func configuracionInicial() {
        logo_bbva_inicio.image = UIImage(named: "bbva_logo")
        imagen_bienvenida.image = UIImage(named: "nasa-home")
        
        saludoLabel.font = UIFont.boldSystemFont(ofSize: 60.0)
        saludoLabel.textColor = .white
        saludoLabel.text = "Hola"
        
        nombreCliente_Label.font = UIFont.boldSystemFont(ofSize: 20.0)
        nombreCliente_Label.textColor = .white
        nombreCliente_Label.text = "Samuel"
        
        boton_ingresar.backgroundColor = UIColor(red: 1, green: 1.0, blue: 1.0, alpha: 0.7)
        boton_ingresar.setTitle("Ingresar", for: .normal)
        
        boton_ingresar.layer.cornerRadius = 13
        
        
        
        boton_no_usuario.setTitle("★ Usar sin ser cliente", for: .normal)
        boton_no_usuario.backgroundColor = UIColor(red: 191/255, green: 199/255, blue: 208/255, alpha: 0.7)
        boton_no_usuario.layer.borderWidth = 0.5
        boton_no_usuario.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    
    
    

    func hacerGradiente() {
        
        let arriba = UIColor(red: 0/255.0, green: 1/255.0, blue: 3/255.0, alpha: 1.0).cgColor
        
        let colorMedioAbajo =  UIColor(red: 1/255.0, green: 6/255.0, blue: 12/255.0, alpha: 1.0).cgColor
        
        let colorMedioArriba =  UIColor(red: 10/255.0, green: 41/255.0, blue: 76/255.0, alpha: 1.0).cgColor
        
        let colorArriba =  UIColor(red: 10/255.0, green: 42/255.0, blue: 78/255.0, alpha: 1.0).cgColor
    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [arriba, colorArriba, colorMedioAbajo, colorMedioArriba]
        gradientLayer.locations = [0.0,0.2,0.3,0.8, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   

}



