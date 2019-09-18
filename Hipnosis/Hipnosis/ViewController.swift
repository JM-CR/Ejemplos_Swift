//
//  ViewController.swift
//  Hipnosis
//
//  Created by Contreras Rocha Josue Mosiah on 9/4/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var hipnosisUno: HipnosisView!
    var hipnosisDos: HipnosisView!
    var campoDeTexto: UITextField!
    
    // Animaciones con física
    var animadorDinamico: UIDynamicAnimator!
    var gravedad: UIGravityBehavior!
    var colision: UICollisionBehavior!
    var propiedadesDeAnimacion: UIDynamicItemBehavior!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let miTache = HipnosisView()
//        let miFrame = CGRect(origin: CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY), size: CGSize(width: 50, height: 200))
//        miTache.frame = miFrame
//        miTache.backgroundColor = .clear
//        self.view.addSubview(miTache)
        
//        let pantallaGrande = CGRect(x: 0, y: 0, width: self.view.bounds.width * 2, height: self.view.bounds.height * 2)
//        let hipnosisGigante = HipnosisView(frame: pantallaGrande)
//        self.scrollView.addSubview(hipnosisGigante)
//        self.scrollView.contentSize = pantallaGrande.size
//        self.scrollView.bounces = false
        
        // Scroll View
        let pantallaGrande = CGRect(x: 0, y: 0, width: self.view.bounds.width * 2, height: self.view.bounds.height)
        let ancho = self.view.bounds.size.width
        let alto = self.view.bounds.size.height
        self.hipnosisUno = HipnosisView(frame: CGRect(x: 0, y: 0, width: ancho, height: alto))
        self.hipnosisDos = HipnosisView(frame: CGRect(x: ancho, y: 0, width: ancho, height: alto))
        self.scrollView.addSubview(hipnosisUno)
        self.scrollView.addSubview(hipnosisDos)
        self.scrollView.contentSize = pantallaGrande.size
        
        // First responder - Pregunta
        hipnosisUno.becomeFirstResponder()
        
        // Campo de texto
        let origen = CGPoint(x: ancho / 8, y: -30)
        let tamañoCampoTexto = CGSize(width: ancho * 0.75, height: 30)
        self.campoDeTexto = UITextField(frame: CGRect(origin: origen, size: tamañoCampoTexto))
        self.campoDeTexto.backgroundColor = .white
        self.campoDeTexto.borderStyle = .roundedRect
        self.campoDeTexto.placeholder = "Hipnotízate..."
        self.campoDeTexto.textAlignment = .center
        self.campoDeTexto.returnKeyType = .done
        self.campoDeTexto.delegate = self   // Todas sus acciones mándamelas a mí
        self.hipnosisUno.addSubview(campoDeTexto)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let ancho = self.view.bounds.size.width
        let alto = self.view.bounds.size.height
        
        // Animación con resorte
        UIView.animate(
            withDuration: 2.0,
            delay: 0,
            usingSpringWithDamping: 0.25,
            initialSpringVelocity: 0,
            options: .layoutSubviews,
            animations: {
                let frameDestino = CGRect(x: ancho / 8, y: alto / 12, width: ancho * 0.75, height: 30)
                self.campoDeTexto.frame = frameDestino
        },
            completion: { (fin) in
                if fin {
                    print("Ya terminó la animación")
                }
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ponerMuchosTextosEnLaPantalla(texto: textField.text!)
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }
    
    func ponerMuchosTextosEnLaPantalla(texto: String) {
        // Animación con físicas
        self.animadorDinamico = UIDynamicAnimator(referenceView: self.view)   // En que vista aplicarla
        self.gravedad = UIGravityBehavior()
        self.gravedad.magnitude = 0.5
        self.animadorDinamico.addBehavior(self.gravedad)   // Añadir efecto al animador
        self.colision = UICollisionBehavior()
//        self.colision.translatesReferenceBoundsIntoBoundary = true   // Convertir bordes en fronteras
        let extremo1 = CGPoint(x: self.view.bounds.midX / 2, y: self.view.bounds.midY * 1.2)
        let extremo2 = CGPoint(x: self.view.bounds.maxX * 0.75, y: self.view.bounds.midY * 1.2)
        let origen1 = CGPoint(x: 0, y: self.view.bounds.midY)
        let origen2 = CGPoint(x: self.view.bounds.maxX, y: self.view.bounds.midY)
        self.colision.addBoundary(withIdentifier: NSString("Plano1"), from: origen1, to: extremo1)
        self.colision.addBoundary(withIdentifier: NSString("Plano2"), from: origen2, to: extremo2)
        self.colision.addBoundary(withIdentifier: NSString("Piso"), from: CGPoint(x: 0, y: self.view.bounds.maxY), to: CGPoint(x: self.view.bounds.maxX, y: self.view.bounds.maxY))
        self.propiedadesDeAnimacion = UIDynamicItemBehavior()
        self.propiedadesDeAnimacion.elasticity = 1.0
        self.animadorDinamico.addBehavior(self.colision)   // Añadir efecto al animador
        
        for _ in 0...20 {
            let labelParaTexto = UILabel()
            labelParaTexto.text = texto
            labelParaTexto.textColor = .black
            labelParaTexto.backgroundColor = .clear
            labelParaTexto.alpha = 0
            labelParaTexto.sizeToFit()
            
            let coordenadaXMaxima = self.view.bounds.maxX - labelParaTexto.bounds.maxX
            let coordenadaYMaxima = self.view.bounds.maxY - labelParaTexto.bounds.maxY
            let origenX = CGFloat.random(in: 0...coordenadaXMaxima)
            let origenY = CGFloat.random(in: 0...coordenadaYMaxima)
            
            labelParaTexto.frame.origin = CGPoint(x: origenX, y: origenY)
            self.hipnosisUno.addSubview(labelParaTexto)
            
            // Animación sin keyframes
            // Aparecen después de estar invisibles
            UIView.animate(withDuration: 3.0, animations: {
                labelParaTexto.alpha = 1
            })
            
            // Animación con keyframes
            // Los junta y explota
            UIView.animateKeyframes(
                withDuration: 2.0,
                delay: 3.0,
                options: .layoutSubviews,
                animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8, animations: {
                        labelParaTexto.center = self.hipnosisUno.center
                    })
                    
                    UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2, animations: {
                        labelParaTexto.center = CGPoint(
                            x: CGFloat.random(in: 0...coordenadaXMaxima),
                            y: CGFloat.random(in: 0...coordenadaYMaxima)
                        )
                    })
            }, completion: { (fin) in
                // Animación con física
                if fin {
                    self.gravedad.addItem(labelParaTexto)   // Aplicar física en labels
                    self.colision.addItem(labelParaTexto)
                    self.propiedadesDeAnimacion.addItem(labelParaTexto)
                }
            })
            
        }
    }
}

