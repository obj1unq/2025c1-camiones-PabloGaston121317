import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000
	const pesoMaximo = 2500

	method puedeCircularEnRuta(nivelPeligrosidad){

		return (! self.excedidoDePeso()) and self.objetosQueSuperanPeligrosidad(nivelPeligrosidad).isEmpty()
	}

	method objetosMasPeligrososQue(cosa){

		return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())
	}

	method objetosQueSuperanPeligrosidad(nivel){

		return cosas.filter({cosa => cosa.superaPeligrosidad(nivel)})
	}

	method excedidoDePeso(){

		return self.pesoTotal() > pesoMaximo
	}

	method pesoTotal(){

		return tara + cosas.sum({cosa=>cosa.peso()})
	}

	method todoPesoPar(){

		return cosas.all({cosa => cosa.pesoEsPar()})
	}

	method descargar(cosa){
		cosas.remove(cosa)
	}
	
	method cargar(cosa) {
		cosas.add(cosa)
	}

}
