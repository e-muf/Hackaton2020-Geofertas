//
//  Principal.swift
//  BBVA
//
//  Created by Samuel Arturo Garrido Sánchez on 2020-10-16.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit

class Principal: UIViewController {
    
    
    
    func configuracionInicial() {
        navigationController?.navigationBar.barStyle = .black
        self.navigationItem.title = "Principal"
        
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configuracionInicial()
        
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
    

}
