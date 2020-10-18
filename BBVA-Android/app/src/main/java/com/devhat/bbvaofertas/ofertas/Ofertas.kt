package com.devhat.bbvaofertas.ofertas

// tienda -> liverpool
// promocion -> 100 puntos con tarjeta gold
// Vigencia -> Vigencia hasta el 2 de octubre
// state -> oferta guardada
data class Ofertas (
    val imagen: Int,
    val tienda: String,
    val promocion : String,
    val vigencia : String,
    val state: Boolean
)