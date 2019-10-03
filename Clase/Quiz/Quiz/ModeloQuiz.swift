//
//  ModeloQuiz.swift
//  Quiz
//
//  Created by Contreras Rocha Josue Mosiah on 8/19/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import Foundation

class ModeloQuiz {
    //MARK: -Declaración de variables
    let preguntas: Array<String> = [
        "¿Cómo se apellida Juan?",
        "Capital de Burkina Faso",
        "¿Cuánto es 2 + 2?"
    ]
    let respuestas: Array<String> = ["Topo", "Guagadougou", "4"]
    var preguntaActual = 0

    //MARK: -Implementación de modelo
    //FIXME: -Hacer que empiece desde la pregunta cero
    func pregunta() -> String {
        self.preguntaActual += 1
        
        if self.preguntaActual == self.preguntas.count {
            self.preguntaActual = 0
        }
        
        return self.preguntas[self.preguntaActual]
    }
    
    func respuesta() -> String {
        return self.respuestas[self.preguntaActual]
    }
    
    //TODO: -Que sean random las preguntas
}
