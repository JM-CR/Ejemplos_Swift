import UIKit

protocol Descriptible {
    func describete() -> String
}

struct PuntoEnElMapa: Descriptible {
    // Propiedades almacenadas
    var longitud: Double
    var latitud: Double
    
    func describete() -> String {
        return "Latitud: \(self.latitud), Longitud: \(self.longitud)"
    }
}

var miPosicion = PuntoEnElMapa(longitud: 25, latitud: 12)
miPosicion.describete()

struct Persona: Descriptible {
    var nombre: String
    var nacionalidad: String
    
    func describete() -> String {
        return "Mi nombre es \(self.nombre) y soy \(self.nacionalidad)"
    }
}

let juanTopo = Persona(nombre: "Juan Topo", nacionalidad: "Springfileano")
juanTopo.describete()

let arregloHeterogeneo: Array<Descriptible> = [miPosicion, juanTopo]
