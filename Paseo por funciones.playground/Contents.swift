import UIKit

func saluda() {
    print("Quiubo")
}

saluda()

// Tuplas
func cuentaVotos(votos: [String], votoAContar: String) -> Int {
    var cuenta = 0
    for voto in votos {
        if votoAContar == voto {
            cuenta += 1
        }
    }
    
    return cuenta
}

print("¿Te gustan los Simpson?")
let votosRecibidos = ["si", "si", "no", "no se", "no", "si"]
let votosAFavor = cuentaVotos(votos: votosRecibidos, votoAContar: "si")

func cuentaTodosLosVotos(votos: [String]) -> (votosAFavor: Int, votosEnContra: Int, abstenciones: Int) {
    let votosSi = cuentaVotos(votos: votos, votoAContar: "si")
    let votosNo = cuentaVotos(votos: votos, votoAContar: "no")
    let votosNulos = votos.count - votosSi - votosNo
    
    return (votosSi, votosNo, votosNulos)
}

let resultadoVotacion = cuentaTodosLosVotos(votos: votosRecibidos)
print("A \(resultadoVotacion.votosAFavor) le gustan")
print("A \(resultadoVotacion.1) no le gustan")
print("\(resultadoVotacion.abstenciones) no viven en el planeta")

let (si, no, _) = cuentaTodosLosVotos(votos: votosRecibidos)
print("A \(si) le gustan")
print("A \(no) no le gustan")


// Nombre de parámetros
func repiteFrase(fraseARepetir frase: String, cuantasVeces n: Int) -> String {
    var resultado = ""
    for _ in 1...n {
        resultado += " \(frase)"   // Nombre interno
    }
    
    return resultado
}

repiteFrase(fraseARepetir: "¡Ay caramba!", cuantasVeces: 3)   // Nombre externo


func repiteFraseTraducional(_ frase: String, _ n: Int) -> String {
    var resultado = ""
    for _ in 1...n {
        resultado += " \(frase)"   // Nombre interno
    }
    
    return resultado
}

repiteFraseTraducional("¡D'oh!", 4)


// Función Optional
func encuentraPares(arregloDeEnteros: [Int]) -> [Int]? {
    if arregloDeEnteros.isEmpty {
        return nil
    }
    
    var numerosPares = [Int]()
    for numero in arregloDeEnteros {
        if numero % 2 == 0 {
            numerosPares.append(numero)
        }
    }
    
    return numerosPares
}

if let paresEncontrados = encuentraPares(arregloDeEnteros: [1, 12, 3, 5, 2]) {
    print(paresEncontrados)
} else {
    print("Enviaste un arreglo vacío... nada que hacer")
}


// Pasar valor por referencia
func pasoPorReferencia(string1: inout String, string2: inout String) {
    let temp = string1
    string1 = string2
    string2 = temp
}

var saludo1 = "Hola"
var saludo2 = "Mundo"

print(saludo1, saludo2)
pasoPorReferencia(string1: &saludo1, string2: &saludo2)
print(saludo1, saludo2)


// Pasar función como valor
func despidete() {
    print("Buen fin de semana")
}

let bye = despidete
bye()

func funcionQueRecibeFuncion(argumento: () -> Void) {
    for i in 1...3 {
        print(String(i))
        argumento()
    }
}

funcionQueRecibeFuncion(argumento: bye)

func fecha() {
    print(Date())
}

funcionQueRecibeFuncion(argumento: fecha)


// Función Inline
let convierteIntAFloat = {
    (enteroAConvertir: Int) -> Float in
    return Float(enteroAConvertir)
}

convierteIntAFloat(42)
