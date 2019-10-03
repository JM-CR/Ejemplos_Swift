import UIKit

// 1. Inicializar punto de partida como 1 de enero de 1990.
var diaInicial = 1
var mesInicial = 1
var añoInicial = 1900
var nombreDiaInicial = "lun"
var cantidadDeDomingos = 0
var diasMeses = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let nombreDias = ["lun", "mar", "mie", "jue", "vie", "sab", "dom"]

// 2. Verificar si es año bisiesto
func verificaBisiesto(año: Int) -> Int {
    var febrero: Int
    if (año / 4 == 0) {
        febrero = 29
    } else {
        febrero = 28
    }
    return febrero
}

//  2.1. Si sí aumentar día en febrero
diasMeses[1] = verificaBisiesto(año: añoInicial)

// 3. Aumentar de mes en mes hasta llegar al 1 de enero de 1901.
while (añoInicial <= 1901) {
    for i in 0..<12 {
        
    }
}

// 4. Verificar si el primer día del mes es Domingo y llevar cuenta.
// 5. Sumar un mes a la fecha acumulada.
// 6. Si hay cambio de año verificar si es bisiesto.
//  6.1. Si sí aumentar día en febrero
// 7. Repetir desde el paso 4 hasta llegar a Diciembre del año 2000.


// 31 x 31 30 31 30 31 31 30 31 30 31
