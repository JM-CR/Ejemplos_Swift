//
//  Inventario.swift
//  Posesionista
//
//  Created by Contreras Rocha Josue Mosiah on 10/9/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import Foundation

class Inventario {
    var todasLasCosas = [Cosa]()
    
    init() {
        for _ in 0..<5 {
            creaCosa()
        }
    }
    
    @discardableResult func creaCosa() -> Cosa {
        let nuevaCosa = Cosa()
        self.todasLasCosas.append(nuevaCosa)
        return nuevaCosa
    }
}
