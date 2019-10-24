//
//  InventarioDeImagenes.swift
//  Posesionista
//
//  Created by Contreras Rocha Josue Mosiah on 10/23/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit

class InventarioDeImagenes {
    
    let cache = NSCache<NSString, UIImage>()
    
    func setImagen(_ imagen: UIImage, paraLaLlave llave: String) {
        self.cache.setObject(imagen, forKey: llave as NSString)
    }
    
    func borraImagen(paraLaLlave llave: String) {
        self.cache.removeObject(forKey: llave as NSString)
    }
    
    func getImagen(paraLaLlave llave: String) -> UIImage? {
        return self.cache.object(forKey: llave as NSString)
    }
    
}
