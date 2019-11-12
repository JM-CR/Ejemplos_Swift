//
//  Dona.swift
//  LaRoscaProhibida
//
//  Created by Contreras Rocha Josue Mosiah on 11/11/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit
import CoreMotion

class Dona: UIView {

    let imagen = UIImage(named: "dona")!
    let puntosPorSegundo = 500.0
    
    var aceleracion = CMAcceleration(x: 0, y: 0, z: 0)
    var velocidadX: Double = 0.0
    var velocidadY: Double = 0.0
    var ultimaActualizacion = Date()
    
    var posicionActual = CGPoint.zero {
        didSet {
            // Calcular nueva posición
            var nuevaX = self.posicionActual.x
            var nuevaY = self.posicionActual.y
            
            if nuevaX < 0 {
                nuevaX = 0
                self.velocidadX /= -2
            } else if nuevaX > self.bounds.size.width - self.imagen.size.width {
                nuevaX = self.bounds.size.width - self.imagen.size.width
                self.velocidadX /= -2
            }
            
            if nuevaY < 0 {
                nuevaY = 0
                self.velocidadY /= -2
            } else if nuevaY > self.bounds.size.height - self.imagen.size.height {
                nuevaY = self.bounds.size.height - self.imagen.size.height
                self.velocidadY /= -2
            }
            
            self.posicionActual = CGPoint(x: nuevaX, y: nuevaY)
            
            // Actualizar frame en pantalla
            let rectActual = CGRect(
                origin: self.posicionActual,
                size: CGSize(
                    width: nuevaX + self.imagen.size.width,
                    height: nuevaY + self.imagen.size.height
                )
            )
            let rectAnterior = CGRect(
                x: oldValue.x,
                y: oldValue.y,
                width: oldValue.x + self.imagen.size.width,
                height: oldValue.y + self.imagen.size.height
            )
            
            setNeedsDisplay(rectActual.union(rectAnterior))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.inicializaVista()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.inicializaVista()
    }
    
    private func inicializaVista() {
        // Centrar la dona
        self.posicionActual = CGPoint(
            x: self.bounds.midX - self.imagen.size.width / 2,
            y: self.bounds.midY - self.imagen.size.height / 2
        )
    }
    
    func actualizaPosicion() {
        // Tiempo transcurrido
        let ahora = Date()
        let segundosDesdeUltimaActualizacion = ahora.timeIntervalSince(self.ultimaActualizacion)
        self.ultimaActualizacion = ahora
        
        // Calcular velocidad
        self.velocidadX += self.aceleracion.x * segundosDesdeUltimaActualizacion
        self.velocidadY -= self.aceleracion.y * segundosDesdeUltimaActualizacion
        
        // Calcular desplazamiento
        let cambioPosicionX = self.velocidadX * segundosDesdeUltimaActualizacion * self.puntosPorSegundo
        let cambioPosicionY = self.velocidadY * segundosDesdeUltimaActualizacion * self.puntosPorSegundo
        self.posicionActual = CGPoint(
            x: self.posicionActual.x + CGFloat(cambioPosicionX),
            y: self.posicionActual.y + CGFloat(cambioPosicionY)
        )
    }
    
    /**
     Pintar dona en controlador.
     
     - Parameter rect: Posición de actualización.
     */
    override func draw(_ rect: CGRect) {
        self.imagen.draw(at: self.posicionActual)
    }
    
}
