//
//  ViewController.swift
//  OnToy
//
//  Created by Contreras Rocha Josue Mosiah on 10/30/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var manager = CLLocationManager()
    var ubicacionPrevia: CLLocation? = nil
    var desplazamientoTotal: CLLocationDistance = 0
    
    @IBOutlet weak var labelLatitud: UILabel!
    @IBOutlet weak var labelLongitud: UILabel!
    @IBOutlet weak var labelPrecisionHorizontal: UILabel!
    @IBOutlet weak var labelAltitud: UILabel!
    @IBOutlet weak var labelPrecisionVertical: UILabel!
    @IBOutlet weak var labelDistanciaRecorrida: UILabel!
    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configurar manager
        self.manager.delegate = self
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
        
        // Configurar mapa
        self.mapa.delegate = self
    }

    /**
     Realiza una acción cada que cambian los permisos de la aplicación.
     */
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("La autorización cambió a: \(status.rawValue)")
        
        // Empezar | Detener trackeo del usuario
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            self.manager.startUpdatingLocation()
            self.mapa.showsUserLocation = true
        default:
            self.manager.stopUpdatingLocation()
            self.mapa.showsUserLocation = false
        }
    }
    
    /**
     Realiza una acción cuando ocurre un error en la localización.
     */
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Formatear error
        let elError = "Error \((error as NSError).code): \(error.localizedDescription)"
        
        // Crear alerta
        let alerta = UIAlertController(title: "Oops...", message: elError, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ya que", style: .cancel, handler: nil)
        alerta.addAction(ok)
        present(alerta, animated: true, completion: nil)
    }
    
    /**
     Realiza una acción cuando cambia la localización.
     */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Mostrar última ubicación
        let nuevaUbicacion = locations.last!
        self.labelLatitud.text = String(format: "%g\u{00B0}", nuevaUbicacion.coordinate.latitude)
        self.labelLongitud.text = String(format: "%g\u{00B0}", nuevaUbicacion.coordinate.longitude)
        self.labelPrecisionHorizontal.text = String(format: "%g m", nuevaUbicacion.horizontalAccuracy)
        self.labelAltitud.text = String(format: "%g m", nuevaUbicacion.altitude)
        self.labelPrecisionVertical.text = String(format: "%g m", nuevaUbicacion.verticalAccuracy)
        
        // Calcular distancia recorrida
        if ubicacionPrevia == nil {
            self.desplazamientoTotal = 0
            
            // Agregar anotación
            let inicio = Lugar(coordenada: nuevaUbicacion.coordinate, titulo: "Inicio", subtitulo: "Primer paso")
            self.mapa.addAnnotation(inicio)
            
            // Centrar en el mapa
            let region = MKCoordinateRegion(center: inicio.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
            self.mapa.setRegion(region, animated: true)
        } else if (nuevaUbicacion.coordinate.latitude != ubicacionPrevia!.coordinate.latitude) && (nuevaUbicacion.coordinate.longitude != ubicacionPrevia!.coordinate.longitude) {
                self.desplazamientoTotal += nuevaUbicacion.distance(from: ubicacionPrevia!) / 1000
            
                // Centrar en el mapa
                self.mapa.setCenter(nuevaUbicacion.coordinate, animated: true)
            
                // Agregar anotación
                let siguienteDestino = Lugar(coordenada: nuevaUbicacion.coordinate, titulo: "Siguiente puerto", subtitulo: nil)
                self.mapa.addAnnotation(siguienteDestino)
        }
        
        // Actualizar posición
        self.ubicacionPrevia = nuevaUbicacion
        self.labelDistanciaRecorrida.text = String(format: "%g km", self.desplazamientoTotal)
    }
    
    /**
     Personaliza la anotación que va a ser añadida al mapa.
     */
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is Lugar {
            // Crear anotación de Homero
            let imagenParaAnotacion = MKAnnotationView(annotation: annotation, reuseIdentifier: "imagenParaLugar")
            let imagen = UIImage(named: "homeroanotacion.png")
            imagenParaAnotacion.image = imagen
            imagenParaAnotacion.canShowCallout = true
            
            return imagenParaAnotacion
        }
        return nil
    }
    
}
