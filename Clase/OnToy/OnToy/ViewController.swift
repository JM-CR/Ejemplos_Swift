//
//  ViewController.swift
//  OnToy
//
//  Created by Contreras Rocha Josue Mosiah on 10/30/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var manager = CLLocationManager()
    var ubicacionPrevia: CLLocation? = nil
    var desplazamientoTotal: CLLocationDistance = 0
    
    @IBOutlet weak var labelLatitud: UILabel!
    @IBOutlet weak var labelLongitud: UILabel!
    @IBOutlet weak var labelPrecisionHorizontal: UILabel!
    @IBOutlet weak var labelAltitud: UILabel!
    @IBOutlet weak var labelPrecisionVertical: UILabel!
    @IBOutlet weak var labelDistanciaRecorrida: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configurar manager
        self.manager.delegate = self
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
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
        default:
            self.manager.stopUpdatingLocation()
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
        print("\(locations.last!)")
    }
}
