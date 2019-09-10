//
//  ViewController.swift
//  Hipnosis
//
//  Created by Contreras Rocha Josue Mosiah on 9/4/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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
        
        let pantallaGrande = CGRect(x: 0, y: 0, width: self.view.bounds.width * 2, height: self.view.bounds.height)
        let ancho = self.view.bounds.size.width
        let alto = self.view.bounds.size.height
        let hipnosisUno = HipnosisView(frame: CGRect(x: 0, y: 0, width: ancho, height: alto))
        let hipnosisDos = HipnosisView(frame: CGRect(x: ancho, y: 0, width: ancho, height: alto))
        self.scrollView.addSubview(hipnosisUno)
        self.scrollView.addSubview(hipnosisDos)
        self.scrollView.contentSize = pantallaGrande.size
    }
}

