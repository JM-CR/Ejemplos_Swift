//
//  ViewController.swift
//  Quiz
//
//  Created by Contreras Rocha Josue Mosiah on 8/15/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var labelPregunta: UILabel!
    @IBOutlet weak var labelRespuesta: UILabel!
    let quiz = ModeloQuiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.labelPregunta.text = self.quiz.pregunta()
    }

    @IBAction func botonPreguntaPresionado() {
        self.labelPregunta.text = self.quiz.pregunta()
        self.labelRespuesta.text = "---"
    }
    
    @IBAction func botonRespuestaPresionado() {
        self.labelRespuesta.text = self.quiz.respuesta()
    }
}

