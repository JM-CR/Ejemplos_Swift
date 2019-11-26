//
//  ListaDeFotos.swift
//  Flickerama
//
//  Created by Contreras Rocha Josue Mosiah on 11/25/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import Foundation

class ListaDeFotos {
    
    let sesion: URLSession = {
        URLSession(configuration: .default)
    }()
    
    func traerFotosRecientes() {
        // Crear petición
        let url = FlickrAPI.URLFotosRecientes()
        let request = URLRequest(url: url)
        
        // Crear tarea en background
        let task = sesion.dataTask(with: request) { (datos, respuesta, error) in
            if let datosJSON = datos {
                // Serializar JSON
                do {
                    let objetoJSON = try JSONSerialization.jsonObject(with: datosJSON, options: [])
                    print(objetoJSON)
                } catch {
                    print("Error al crear objeto JSON: \(error)")
                }
            } else if let errorEnPeticion = error {
                print("Error al recuperar las fotos recientes: \(errorEnPeticion)")
            } else {
                print("Error inesperado")
            }
        }
        
        // Hacer petición
        task.resume()
    }
    
}
