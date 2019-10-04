//
//  Ejemplo.swift
//  Debugger
//
//  Created by Contreras Rocha Josue Mosiah on 10/3/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import Foundation

protocol DescribeArreglo {
    var arreglo: [Int] { get set }
    func imprimeNumeros()
}

struct Ejemplo: DescribeArreglo {
    var arreglo: [Int]
    
    func agrega(numero: Int) {
        
    }
    
    func imprimeNumeros() {
        for valor in arreglo {
            print("\(valor)")
        }
    }
}
