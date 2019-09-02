import UIKit

protocol Descriptible {
    func describete() -> String
}

// Propiedades y métodos
class Persona: Descriptible {
    var nombre: String
    var apellido: String
    var nacionalidad = "Mexicana"
    let añoDeNacimiento: Int
    var disponible = true
    var edad: Int {
        let añoActual = Calendar.current.component(.year, from: Date())
        return añoActual - self.añoDeNacimiento
    }
    
    // Constructor designado
    init(nombre: String, apellido: String, añoDeNacimiento: Int) {
        self.nombre = nombre
        self.apellido = apellido
        self.añoDeNacimiento = añoDeNacimiento
    }
    
    // Constructor conveniento
    convenience init(nombre: String, apellido: String, añoDeNacimiento: Int, disponible: Bool) {
        self.init(nombre: nombre, apellido: apellido, añoDeNacimiento: añoDeNacimiento)
        self.disponible = disponible
    }
    
    // Método
    func casar(con pareja: Persona, tomaApellido: Bool) {
        if (self.disponible && pareja.disponible) {
            if tomaApellido {
                self.apellido = pareja.apellido
            }
            self.disponible = false
        }
        else {
            print("No se puede casar a \(self.nombre) con \(pareja.nombre) porque la bigamia no es legal")
        }
    }
    
    // Protocolo
    func describete() -> String {
        return "Me llamo \(self.nombre) \(self.apellido), nací en \(self.añoDeNacimiento), mi nacionalidad es \(self.nacionalidad) y \(self.disponible ? "disponible" : "no disponible") para casarme"
    }
}

var juanTopo = Persona(nombre: "Juan", apellido: "Topo", añoDeNacimiento: 1968)
juanTopo.describete()
juanTopo.edad

var ednaKrabapple = Persona(nombre: "Edna", apellido: "Krabapple", añoDeNacimiento: 1975)
ednaKrabapple.describete()
ednaKrabapple.casar(con: juanTopo, tomaApellido: true)
ednaKrabapple.describete()

var moeSislak = Persona(nombre: "Moe", apellido: "Sislak", añoDeNacimiento: 1965)
ednaKrabapple.casar(con: moeSislak, tomaApellido: false)

var apu = Persona(nombre: "Apu", apellido: "N", añoDeNacimiento: 1980, disponible: false)


// Herencia
class Alumno: Persona {
    var carrera: String
    var semestre = 1
    var promedio: Double = 0.0
    
    // Constructor
    init(nombre: String, apellido: String, añoDeNacimiento: Int, estudia: String) {
        self.carrera = estudia
        super.init(nombre: nombre, apellido: apellido, añoDeNacimiento: añoDeNacimiento)
    }
    
    // Sobreescritura
    override func describete() -> String {
        let descripcionPersona = super.describete()
        let descripcionDeAlumno = "Estudio \(self.carrera) en el semestre \(self.semestre) con promedio de \(self.promedio)"
        return "\(descripcionPersona). \(descripcionDeAlumno)."
    }
}

let martinPrince = Alumno(nombre: "Martin", apellido: "Prince", añoDeNacimiento: 1999, estudia: "Casa Bolsero")
martinPrince.describete()
