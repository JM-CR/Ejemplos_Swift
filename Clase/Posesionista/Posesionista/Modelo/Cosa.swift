//
//  Cosa.swift
//  Posesionista
//
//  Created by Contreras Rocha Josue Mosiah on 10/9/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import Foundation

class Cosa: NSObject {
    
    var nombre: String
    var valorEnPesos: Int
    var numeroDeSerie: String?
    let fechaDeCreacion: Date
    let llaveDeCosa: String
    
    init(nombre: String, valor: Int, serie: String?, alta: Date) {
        self.nombre = nombre
        self.valorEnPesos = valor
        self.numeroDeSerie = serie
        self.fechaDeCreacion = alta
        self.llaveDeCosa = UUID().uuidString
        super.init()
    }
    
    override convenience init() {
        let sustantivos = ["Aguacate", "Termo", "Audífonos"]
        let adjetivos = ["Verde", "Viejo", "Caro"]
        let nombreAleatorio = "\(sustantivos.randomElement()!) \(adjetivos.randomElement()!)"
        let valorAleatorio = Int.random(in: 0...100)
        let serieAleatorio = UUID().uuidString.components(separatedBy: "-").first!
        self.init(nombre: nombreAleatorio, valor: valorAleatorio, serie: serieAleatorio, alta: Date())
    }
}
