//
//  Foto.swift
//  Flickerama
//
//  Created by Contreras Rocha Josue Mosiah on 11/25/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import Foundation

class Foto {
    
    let titulo: String
    let urlRemoto: URL
    let idDeFoto: String
    let fechaTomada: Date
    
    init(titulo: String, urlRemoto: URL, idDeFoto: String, fechaTomada: Date) {
        self.titulo = titulo
        self.urlRemoto = urlRemoto
        self.idDeFoto = idDeFoto
        self.fechaTomada = fechaTomada
    }
    
}
