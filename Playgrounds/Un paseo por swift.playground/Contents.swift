import UIKit

let cadena: String = "Hola Mundo"
let cadenaAbreviada = "Adiós mundo"

var edad: Int
edad = 20
edad = 19

// String Interpolation
print("Hola, tengo \(edad) años")

var booleano = true
booleano = false

var double = 3.1425926
let pi = Double.pi

pi.isEqual(to: 3.1416)

extension Double {
    func saluda() {
        print("Hola amiguito, soy el número \(self)")
    }
}

pi.saluda()

// Colecciones
var arregloAnimalitosExplicito: Array<String> = ["🐸", "🐶", "🐥"]
var arregloAnimalitosSemiExplicito: [String] = ["🐸", "🐶", "🐥"]
var arregloImplicito = ["🐸", "🐶", "🐥"]
var granjaVacia = [String]()

print(arregloAnimalitosSemiExplicito[0])

arregloImplicito.append("🙈")
arregloImplicito += ["🙈"]
arregloImplicito.count

arregloAnimalitosSemiExplicito.description

var miGranja = ""
for i in 0..<arregloAnimalitosExplicito.count {
    miGranja += arregloAnimalitosExplicito[i]
    miGranja += ", "
}

for animal in arregloAnimalitosSemiExplicito {
    print("Ahora le toca al \(animal)")
}

for (indice, animal) in arregloAnimalitosSemiExplicito.enumerated() {
    print("El animal \(indice) es un \(animal)")
}

let multiplicando = 5
let multiplicador = 12
var resultado = 0

for _ in 0..<multiplicador {
    resultado += multiplicando
}
print(resultado)

var animalesEnEspañol = ["pollito", "gallina", "cerdito"]
var animalesEnIngles = ["chicken", "hen", "pig"]

if animalesEnEspañol[0] == animalesEnIngles[0] {
    print("Sí son iguales")
} else {
    print("No son iguales")
}

// Diccionario
let diccionario: Dictionary<String, String> = [
    "pollito": "chicken",
    "gallina": "hen",
    "cerdo": "pig",
    "lápiz": "pencil"
]

// Implicit Optional Unwrapping
if let optional = diccionario["gallina"] {
    print(optional)   // Desempaquetado implícito
} else {
    print("Ese animal no está en el diccionario")
}

var miOpcional: Int? = 9
print(miOpcional ?? "No hay nada adentro")   // Otra forma de desempaquetar

var traductorNumeros: Dictionary<String, Int> = ["Um": 1, "Dois": 2, "Três": 3, "Quatro": 4, "Cinco": 5]
