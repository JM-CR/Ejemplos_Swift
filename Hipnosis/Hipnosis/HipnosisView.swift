//
//  HipnosisView.swift
//  Hipnosis
//
//  Created by Contreras Rocha Josue Mosiah on 9/4/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit

class HipnosisView: UIView {
    private var colorDelCirculo: UIColor = .blue
    
    func inicializaVista() {
        self.backgroundColor = .clear
    }
    
    override init(frame: CGRect) {
        // Este inicializador se llama cuando se instancia la vista desde código
        super.init(frame: frame)
        inicializaVista()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Este inicializador se llama cuando se instancia la vista desde storyboard
        super.init(coder: aDecoder)
        inicializaVista()
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
//        path.move(to: self.bounds.origin)
//        path.addLine(to: CGPoint(x: self.bounds.maxX, y: self.bounds.maxY))
//        path.move(to: CGPoint(x: self.bounds.maxX, y: 0))
//        path.addLine(to: CGPoint(x: 0, y: self.bounds.maxY))
        
        var centro: CGPoint = .zero
        centro.x = self.bounds.midX
        centro.y = self.bounds.midY
//        let radio = min(self.bounds.size.width, self.bounds.size.height) / 2.0
//        path.move(to: CGPoint(x: centro.x + radio, y: centro.y))
//        path.addArc(withCenter: centro, radius: radio, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
        let radioMaximo = hypot(self.bounds.size.width / 2, self.bounds.size.height / 2)
        for radioActual in stride(from: radioMaximo, to: 0, by: -15) {
            path.move(to: CGPoint(x: centro.x + radioActual, y: centro.y))
            path.addArc(withCenter: centro, radius: radioActual, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        }
        path.lineWidth = 5
//        UIColor.lightGray.setStroke()
        self.colorDelCirculo.setStroke()
        path.stroke()
    }
    
}
