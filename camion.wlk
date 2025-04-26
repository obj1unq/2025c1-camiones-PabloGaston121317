import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000
	const pesoMaximo = 2500

	method totalBultos(){

		return cosas.sum(cosa => cosa.bulto())
	}

	method pesos(){

		return cosas.map({cosa => cosa.peso()})
	}

	method cosaMasPesada(){

		return cosas.max({cosa=> cosa.peso()})
	}

	method tieneAlgoQuePesaEntre(min,max){

		return cosas.any({cosa => cosa.peso().between(min, max) })
	}

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

		return tara + self.pesoDeLaCarga()
	}

	method pesoDeLaCarga(){

		return cosas.sum({cosa => cosa.peso()})
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
