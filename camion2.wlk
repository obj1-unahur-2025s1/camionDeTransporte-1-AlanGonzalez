object camion { 
    const cosas = [] 
    method cargar(cosa) { cosas.add(cosa) cosa.sufrirCambio() }
    method descargar(cosa) = cosas.remove(cosa) 
    method pesoTotal() = cosas.sum({c=>c.peso()}) + 1000 
    method pesoPares() = cosas.all({ n => n / 2 == 0 }) 
    method cosaPesa(valor) = cosas.any({c=>c.peso() == valor}) 
    method cosaPeligrosa(nivel) = cosas.find({c=>c.peligro() == nivel}) 
    method todoPeligroso(nivel) = cosas.filter({c=>c.peligro() > nivel}) 
    method superaPeligrosidad(peligro) = cosas.filter({c=>c.peligro() > peligro}) 
    method superaPesoMaximo() = self.pesoTotal() > 2500 
    method puedeCircular(nivelPeligroso) = not self.superaPesoMaximo() && cosas.all({c=>c.peligroso() <= nivelPeligroso}) 
    method pesoEntre(valor1, valor2) = cosas.any({c=>c.peso() > valor1 && c.peso() < valor2}) 
    method cosaMayorPeso() = cosas.max({c=>c.peso()}) 
    method totalDeBultos() = cosas.map({c=>c.bulto()}).sum() }

//Se pide que se le pueda cargar y descargar cosas (de 1 a vez) y también cual es el peso total del camión, incluyendo su tara que es de 1000 kg. 
//También se necesita conocer si los pesos de todas las cosas cargadas en el camión son números pares. 
//Debemos poder consultar si hay alguna cosa que pesa un determinado valor. 
//Para un mejor control del tipo de peligro que puede representar la carga, se debe poder obtener la primer cosa cargada que tenga un determinado nivel de peligrosidad 
//Obtener todas las cosas que superan un determinado nivel de peligrosidad. 
//Para facilitar los controles, también nos piden que se pueda consultar la lista de cosas que superan el nivel de peligrosidad de una cosa dada. 
//Conocer si el camión está excedido del peso máximo permitido,que es de 2500 kg. 
//Saber si el camión puede circular en ruta. Eso depende de que no exceda el peso máximo permitido y ninguno de los objetos cargados supere un nivel máximo de peligrosidad que depende del viaje, 
// por eso para este caso el valor del nivel se pasará como argumento.