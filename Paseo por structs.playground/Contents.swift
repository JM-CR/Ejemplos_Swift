import UIKit

// Implementar Protocolo
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
    
    func distanciaEntreElPunto(coordenada punto: PuntoEnElMapa) -> Double {
        let distanciaLatitud = self.latitud - punto.latitud
        let distanciaLongitud = self.longitud - punto.longitud
        
        return sqrt(pow(distanciaLatitud, 2) + pow(distanciaLongitud, 2))
    }
}

var miPosicion = PuntoEnElMapa(longitud: 25, latitud: 12)
var miDestino = PuntoEnElMapa(longitud: 60, latitud: 8)
miPosicion.describete()
miPosicion.distanciaEntreElPunto(coordenada: miDestino)

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


// Struct con structs | Set | Get
struct Punto: Descriptible {
    var x = 0.0, y = 0.0
    
    func describete() -> String {
        return "(\(self.x), \(self.y))"
    }
}

struct Tamaño: Descriptible {
    var ancho = 0.0, alto = 0.0
    
    func describete() -> String {
        return "\(self.ancho) * \(self.alto)"
    }
}

struct Rectangulo: Descriptible {
    // Type Property
    static var tipo = "Rectángulo"
    
    // Property Observer
    var origen = Punto() {
        willSet {  // Antes de modificarse
            print("Vas a mover el origen a la coordenada: \(newValue.describete())")
        }
        didSet {   // Después de modificarse
            print("El punto ya se movió desde \(oldValue.describete())")
        }
    }
    var tamaño = Tamaño()
    
    // Property getter | setter
    var centro: Punto {
        get {
            let centroX = origen.x + (tamaño.ancho / 2)
            let centroY = origen.y + (tamaño.alto / 2)
            return Punto(x: centroX, y: centroY)
        }
        set {
            origen.x = newValue.x - (tamaño.ancho / 2)
            origen.y = newValue.y - (tamaño.alto / 2)
        }
    }
    
    // Get implícito
    var area: Double {
        return tamaño.ancho * tamaño.alto
    }
    
    // Cambiar propiedad desde dentro
    mutating func desplazate(alPunto punto: Punto) {
        self.origen = punto
    }
    
    // Protocolo
    func describete() -> String {
        return "Origen: \(self.origen.describete()), tamaño: \(self.tamaño.describete()), centro: \(self.centro.describete()), área: \(self.area)"
    }
}

var miRectangulo = Rectangulo(origen: Punto(x: 50, y: 20), tamaño: Tamaño(ancho: 100, alto: 75))
miRectangulo.describete()
miRectangulo.centro = Punto(x: 200, y: 108)
miRectangulo.describete()
miRectangulo.desplazate(alPunto: Punto(x: 10, y: 34))
miRectangulo.describete()
