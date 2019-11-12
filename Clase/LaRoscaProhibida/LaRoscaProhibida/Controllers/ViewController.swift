//
//  ViewController.swift
//  LaRoscaProhibida
//
//  Created by Contreras Rocha Josue Mosiah on 11/11/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    let intervaloDeActualizacion = 0.01
    let motionManager = CMMotionManager()
    let colaDeOperaciones = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager.deviceMotionUpdateInterval = intervaloDeActualizacion
        motionManager.startDeviceMotionUpdates(to: colaDeOperaciones) { (datosDeSensores: CMDeviceMotion!, error: Error!) in
            // Actualizar aceleración de dona
            let vistaDeDona = self.view as! Dona
            vistaDeDona.aceleracion = datosDeSensores.gravity
            
            // Actualizar en otro thread
            DispatchQueue.main.async {
                vistaDeDona.actualizaPosicion()
            }
        }
    }


}

