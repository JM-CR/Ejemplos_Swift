//
//  ViewController.swift
//  Sensores
//
//  Created by Contreras Rocha Josue Mosiah on 11/6/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var botonEventos: UIButton!
    @IBOutlet weak var botonContinua: UIButton!
    @IBOutlet weak var botonDetener: UIButton!
    @IBOutlet weak var labelAcelerometro: UILabel!
    @IBOutlet weak var labelGiroscopio: UILabel!
    @IBOutlet weak var labelActitud: UILabel!
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    var timerDeActualizacion: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Opciones iniciales
        self.botonEventos.isEnabled = true
        self.botonContinua.isEnabled = true
        self.botonDetener.isEnabled = false
    }

    /**
     Muestra información de los sensores cada cierto tiempo.
     */
    @IBAction func actualizaPorEvento(_ sender: UIButton) {
        if self.motionManager.isDeviceMotionAvailable {
            // Desactivar opciones
            self.botonEventos.isEnabled = false
            self.botonContinua.isEnabled = false
            self.botonDetener.isEnabled = true
            
            // Frecuencia de actualización
            self.motionManager.deviceMotionUpdateInterval = 0.1
            
            // Empezar actualizaciones
            self.motionManager.startDeviceMotionUpdates(to: queue) { (device, error) in
                // Código a ejecutar en Queue
                self.actualizaDisplay()
            }
            
        }
    }
    
    /**
     Muestra información recolectada de los sensores.
     */
    @IBAction func actualizaContinua(_ sender: UIButton) {
        if self.motionManager.isDeviceMotionAvailable {
            // Desactivar opciones
            self.botonEventos.isEnabled = false
            self.botonContinua.isEnabled = false
            self.botonDetener.isEnabled = true
            
            // Frecuencia de actualización
            self.motionManager.deviceMotionUpdateInterval = 0.1
            
            // Tiempo de lectura
            self.timerDeActualizacion = Timer(timeInterval: 0.1, target: self, selector: #selector(actualizaDisplay), userInfo: nil, repeats: true)
        }
    }
    
    /**
    Ejecuta código de lectura sobre sensores.
     */
    @objc func actualizaDisplay() {
        if let device = self.motionManager.deviceMotion {
            // Código del queue
            let aceleracion = device.userAcceleration
            let gravedad = device.gravity
            let rotacion = device.rotationRate
            let actitud = device.attitude
            
            let textoAceleracion = String(format:
                "Aceleración\n-----------\n" +
                "Gravedad x: %+.2f\t\tUsuario x: %+.2f\n" +
                "Gravedad y: %+.2f\t\tUsuario y: %+.2f\n" +
                "Gravedad z: %+.2f\t\tUsuario z: %+.2f\n",
                gravedad.x, aceleracion.x,
                gravedad.y, aceleracion.y,
                gravedad.z, aceleracion.z
            )
            
            let textoGiroscopio = String(format:
                "Rotación\n--------\n" +
                "x: %+.2f\n" +
                "y: %+.2f\n" +
                "z: %+.2f\n",
                rotacion.x, rotacion.y, rotacion.z
            )
            
            let textoActitud = String(format:
                "Actitud\n-------\n" +
                "Giro: %+.2f\n" +
                "Inclinación: %+.2f\n" +
                "Cabeceo: %+.2f\n",
                actitud.roll, actitud.pitch, actitud.yaw
            )
            
            // Comunicación con el main thread
            DispatchQueue.main.async {
                self.labelAcelerometro.text = textoAceleracion
                self.labelGiroscopio.text = textoGiroscopio
                self.labelActitud.text = textoActitud
            }
        }
    }
    
    /**
     Resetea la apliación a las opciones iniciales.
     */
    @IBAction func actualizaDetener(_ sender: UIButton) {
        // Detener sensores
        self.motionManager.stopDeviceMotionUpdates()
        
        // Detener timer
        if self.timerDeActualizacion != nil {
            self.timerDeActualizacion.invalidate()
            self.timerDeActualizacion = nil
        }
        
        // Opciones iniciales
        self.botonEventos.isEnabled = true
        self.botonContinua.isEnabled = true
        self.botonDetener.isEnabled = false
    }
    
}

