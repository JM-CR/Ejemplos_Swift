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
    
//    /**
//     Inicializa el inventario con cinco cosas.
//     */
//    init() {
//        for _ in 0..<5 {
//            creaCosa()
//        }
//    }
    
    @discardableResult func creaCosa() -> Cosa {
        let nuevaCosa = Cosa()
        self.todasLasCosas.append(nuevaCosa)
        return nuevaCosa
    }
    
    /**
     Elimina un elemento del arreglo de cosas.
     
     - Parameter cosaAEliminar: Elemento a borrar.
     */
    func eliminaCosa(cosaAEliminar: Cosa) {
        if let indiceDeCosa = self.todasLasCosas.firstIndex(of: cosaAEliminar) {
            todasLasCosas.remove(at: indiceDeCosa)
        }
    }
    
    /**
     Mueve un elemento de un index hacia otro.
     
     - Parameter de: Primer elemento.
     - Parameter hacia: Segundo elemento.
     */
    func reordena(de: Int, hacia: Int) {
        guard de != hacia else {
            return
        }
        let cosaAMover = todasLasCosas[de]
        todasLasCosas.remove(at: de)
        todasLasCosas.insert(cosaAMover, at: hacia)
    }
}
