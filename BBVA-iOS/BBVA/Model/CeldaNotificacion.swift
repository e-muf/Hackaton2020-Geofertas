//
//  Notificacion.swift
//  BBVA
//
//  Created by Samuel Arturo Garrido Sánchez on 2020-10-17.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit

class CeldaNotificacion: UITableViewCell {
    @IBOutlet var label_tienda: UILabel!
    @IBOutlet var label_nombre_oferta: UILabel!
    @IBOutlet var label_vigencia: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
