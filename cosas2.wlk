object knightRider { 
    method peso() = 500 
    method peligro() = 10 
    method bulto() = 1 
    method sufrirCambio() = null 
}

object bumblebee { 
    var transformado = false 
    method peso() = 800 
    method transformado() = transformado 
    method auto() { transformado = false} 
    method peligro() = if (transformado ) 15 else 30 method 
    bulto() = 2 method sufrirCambio() { transformado = true } }

object paqueteLadrillos { 
    var cantidad = 0 
    method nuevaCantidad(nueva) { cantidad = cantidad + nueva} 
    method cantidad() = cantidad method peso() = cantidad * 2 
    method peligro() = 2 method bulto() { 
        if (cantidad <= 100){ 
            return 1 
            } else if(cantidad > 101 and cantidad < 300){ 
                return 2 
                } else (cantidad > 301){ 
                    return 3 
                    } 
        } 
    method sufrirCambio() {self.nuevaCantidad(12)} }

object arena { 
    var peso = 20 
    method peso() = peso 
    method nuevoPeso(nuevo) { peso = peso + nuevo} 
    method peligro() = 1 
    method bulto() = 1 
    method sufrirCambio() {peso = peso - 10} }

object bateriaAntiAerea { 
    var tieneMisiles = true 
    method sinMisiles() { tieneMisiles = false} 
    method cargado() = tieneMisiles method peso() = if(tieneMisiles) 300 else 200 
    method peligro() = if(tieneMisiles ) 100 else 0 
    method bulto() { 
        if (tieneMisiles){ 
            return 2 
            }else{ 
                return 1 
            } 
    } 
    method sufrirCambio() { tieneMisiles } }

object contenedorPortuario { 
    const contenido = [] 
    method agregarCosas(cosas) = contenido.add(cosas) 
    method peso() = 100 + contenido.map({c=>c.peso()}).sum() 
    method peligro() = if(contenido.isEmpty()) 0 else contenido.max({c=>c.peligro()}) 
    method bulto() = 1 + contenido.map({c=>c.bulto()}).sum() 
    method sufrirCambio() {
        contenido.forEach({c=>c.sufrirCambio()})
        return true
    } 
    method contenido() = contenido
    }

object residuosRadioactivos { 
    var peso = 0 
    method peso() = peso 
    method nuevoPeso(nuevo) { peso += nuevo} 
    method peligro() = 200 method bulto() = 1 
    method sufrirCambio() {self.nuevoPeso(15)} }

object embalajeSeguridad { 
    var embuelto = null 
    method embuelto() = embuelto 
    method nuevoEmbuelto(nuevo) {embuelto = nuevo} 
    method peso() = embuelto.peso() 
    method pelogro() = embuelto.peligro() / 2 
    method bulto() = 2 
    method sufrirCambio() = null 
    }

//Knight Rider: pesa 500 kilos y su nivel de peligrosidad es 10. 
//Bumblebee: pesa 800 kilos y su nivel de peligrosidad es 15 si está transformado en auto o 30 si está como robot. 
//Paquete de ladrillos: cada ladrillo pesa 2 kilos, la cantidad de ladrillos que tiene puede variar. La peligrosidad es 2. 
//Arena a granel: el peso es variable, la peligrosidad es 1. 
//Batería antiaérea : el peso es 300 kilos si está con los misiles o 200 en otro caso. En cuanto a la peligrosidad es 100 si está con los misiles y 0 en otro caso. 
//Contenedor portuario: un contenedor puede tener otras cosas adentro. El peso es 100 + la suma de todas las cosas que estén adentro. Es tan peligroso como el objeto más peligroso que contiene. 
//Si está vacío, su peligrosidad es 0. //Residuos radioactivos: el peso es variable y su peligrosidad es 200. 
// Embalaje de seguridad: es una cobertura que envuelve a cualquier otra cosa. El peso es el peso de la cosa que tenga adentro. El nivel de peligrosidad es la mitad del nivel de peligrosidad de lo que envuelve.