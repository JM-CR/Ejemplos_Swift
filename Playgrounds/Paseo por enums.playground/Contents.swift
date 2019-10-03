import UIKit

protocol Descriptible {
    func describete() -> String
}

// Enum básico
enum Simpsons: Descriptible {
    case Homero
    case Marge
    case Bart
    case Lisa
    case Maggie
    
    func describete() -> String {
        return "Soy un Simpson"
    }
}

var personaje = Simpsons.Homero
personaje = .Lisa
personaje.describete()

if personaje == .Homero {
    print("Mmmmm la rosca prohibida")
}

switch personaje {
case .Homero:
    print("Mmm rosquillas")
case .Marge:
    print("Grrr")
case .Bart:
    print("¡Ay caramba!")
case .Lisa:
    print("Preparé gazpacho")
default:
    print("Chick chick")
}


// Raw value enum
enum Semana: Int {
    case Lunes = 1
    case Martes, Miercoles, Jueves, Viernes
    case Sabado = 100
    case Domingo = 200
}

var dia = Semana.Lunes
dia.rawValue

let diaDeDescanso = Semana(rawValue: 200)


enum Aerolinea: String, Descriptible {
    case AM = "Aeroméxico"
    case MX = "Mexicana"
    case VB = "Viva Aerobús"
    case Y4 = "Volaris"
    static let todasLasAerolineas = [AM, MX, VB, Y4]
    
    func puntual() -> Bool {
        if self == .AM || self == .VB {
            return true
        }
        return false
    }
    
    func describete() -> String {
        if self == .MX {
            return "QEPD"
        }
        return self.rawValue
    }
}

var miLineaAerea = Aerolinea.AM
miLineaAerea.describete()
miLineaAerea.puntual()
miLineaAerea = .MX
miLineaAerea.describete()
miLineaAerea.puntual()

Aerolinea.todasLasAerolineas[2].puntual()
Aerolinea.Y4.rawValue
Aerolinea.Y4.puntual()


// Associated value enum
enum Transporte {
    case metro(Int)
    case coche(String, Int, String)
    case avion(Aerolinea, Int)
}

var miViaje = Transporte.metro(7)
miViaje = .coche("Bentley", 666, "ZZZ")

func transporteComodo(medioTransporte: Transporte) -> (Bool, String) {
    switch medioTransporte {
    case .avion(let compañia, _):
        if compañia == .MX {
            return (false, "Ya ni existe")
        }
        return (compañia == .AM , "La mejor manera de volar")
    case .coche(let modelo, _, _) where modelo != "Vocho":
        return (true, "Pero tienes que manejar")
    default:
        return (false, "Tiene cobertura muy limitada")
    }
}

transporteComodo(medioTransporte: miViaje)
miViaje = .avion(.AM, 123)
transporteComodo(medioTransporte: miViaje)
transporteComodo(medioTransporte: Transporte.metro(11))
