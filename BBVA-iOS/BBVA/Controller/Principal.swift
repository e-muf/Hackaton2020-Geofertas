//
//  Principal.swift
//  BBVA
//
//  Created by Samuel Arturo Garrido Sánchez on 2020-10-16.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit

class Principal: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet var colleccionOfertas: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    var halfModalTransitioningDelegate: HalfModalTransitioningDelegate?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        self.halfModalTransitioningDelegate = HalfModalTransitioningDelegate(viewController: self, presentingViewController: segue.destination)
        
        segue.destination.modalPresentationStyle = .custom
        segue.destination.transitioningDelegate = self.halfModalTransitioningDelegate
    }
    

}
