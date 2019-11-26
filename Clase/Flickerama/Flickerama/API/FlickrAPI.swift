//
//  FlickerAPI.swift
//  Flickerama
//
//  Created by Contreras Rocha Josue Mosiah on 11/25/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import Foundation

struct FlickrAPI {
    
    private static let URLBase = "https://api.flickr.com/services/rest"
    private static let APIKey = "44015f12fe84d4c31c7bc090182c787f"
    
    private static func URLFlickr(metodo: Metodo, parametros: [String : String]?) -> URL {
        // Crear elementos
        var componentes = URLComponents(string: URLBase)!
        var itemsDeQuery = [URLQueryItem]()
        
        // Parámetros generales
        let parametrosBase = [
            "method": metodo.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": self.APIKey
        ]
        
        for (llave, valor) in parametrosBase {
            let item = URLQueryItem(name: llave, value: valor)
            itemsDeQuery.append(item)
        }
        
        
        // Parámetros extras GET
        if let parametrosAdicionales = parametros {
            for (llave, valor) in parametrosAdicionales {
                let item = URLQueryItem(name: llave, value: valor)
                itemsDeQuery.append(item)
            }
        }
        
        // Generar URL
        componentes.queryItems = itemsDeQuery
        return componentes.url!
    }
    
    static func URLFotosRecientes() -> URL {
        return URLFlickr(metodo: .FotosRecientes, parametros: ["extras" : "url_h,date_taken"])
    }
    
    
    static func fotos(desdeJSON datos: Data) -> RespuestaDeFotos {
        do {
            // Serializar JSON
            let objetoJSON = try JSONSerialization.jsonObject(with: datos, options: [])
            
            guard let diccionarioJSON = objetoJSON as? [String : Any],
                let diccionarioPhotos = diccionarioJSON["photos"] as? [String : Any],
                let arregloDePhotos = diccionarioPhotos["photo"] as? [[String : Any]] else {
                    return .fracaso(ErrorDeFlickr.JSONInvalido)
            }
            
            // Extrar datos de interés
            var fotosRecuperadas = [Foto]()
            return .exito(fotosRecuperadas)
        } catch {
            return .fracaso(error)
        }
    }
    
}
