//
//  AppNavController.swift
//  BBVA
//
//  Created by Samuel Arturo Garrido Sánchez on 2020-10-17.
//  Copyright © 2020 SamArtGS. All rights reserved.
//

import UIKit

class AppNavController: UINavigationController, HalfModalPresentable {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isHalfModalMaximized() ? .default : .lightContent
    }
    
    
}
