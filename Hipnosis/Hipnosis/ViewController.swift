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
        
        // Animaciones
        UIView.animate(withDuration: <#T##TimeInterval#>, animations: <#T##() -> Void#>)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ponerMuchosTextosEnLaPantalla(texto: textField.text!)
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }
    
    func ponerMuchosTextosEnLaPantalla(texto: String) {
        for _ in 0...20 {
            let labelParaTexto = UILabel()
            labelParaTexto.text = texto
            labelParaTexto.textColor = .black
            labelParaTexto.backgroundColor = .clear
            labelParaTexto.sizeToFit()
            
            let coordenadaXMaxima = self.view.bounds.maxX - labelParaTexto.bounds.maxX
            let coordenadaYMaxima = self.view.bounds.maxY - labelParaTexto.bounds.maxY
            let origenX = CGFloat.random(in: 0...coordenadaXMaxima)
            let origenY = CGFloat.random(in: 0...coordenadaYMaxima)
            
            labelParaTexto.frame.origin = CGPoint(x: origenX, y: origenY)
            self.hipnosisUno.addSubview(labelParaTexto)
        }
    }
}

