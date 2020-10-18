//
//  Configuracion.swift
//  BBVA
//
//  Created by Samuel Arturo Garrido Sánchez on 2020-10-17.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit

class Configuracion: UIViewController,UITableViewDataSource,UITableViewDelegate, HalfModalPresentable{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style:UITableViewCell.CellStyle.default,reuseIdentifier:"celdaConfiguracionIdentifier")
        
        let boldFont = UIFont.systemFont(ofSize: 18, weight: .bold)
        if #available(iOS 13.0, *) {
            let config = UIImage.SymbolConfiguration(font: boldFont)
            let image = UIImage(systemName: "speaker", withConfiguration: config)
            cell.imageView!.image = image
            cell.textLabel?.text = "Si funciona"
        } else {
            cell.textLabel?.text = "Configuracion"
        }
        cell.textLabel?.text = "configuracion"
        return cell
    }
    
    
    @IBOutlet var tabla_config: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
