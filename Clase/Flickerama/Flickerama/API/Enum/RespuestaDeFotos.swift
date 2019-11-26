//
//  RespuestaDeFotos.swift
//  Flickerama
//
//  Created by Contreras Rocha Josue Mosiah on 11/25/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import Foundation

enum RespuestaDeFotos {
    case exito([Foto])
    case fracaso(Error)
}
