object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
	method superaPeligrosidad(nivel) = self.nivelPeligrosidad() > nivel
	method pesoEsPar() = self.peso().even()
}

object bumblebee {
	var transformacion = auto
	method peso() = 800
	method nivelPeligrosidad() = transformacion.nivelPeligrosidad()
	method transformacion() = transformacion
	method transformacion(_transformacion){
		transformacion = _transformacion
	}
	method pesoEsPar() = self.peso().even()
	method superaPeligrosidad(nivel) = self.nivelPeligrosidad() > nivel
}

object robot{
	method nivelPeligrosidad() = 30
}

object auto {
	method nivelPeligrosidad() = 15
}

object ladrillos{
	var cantLadrillos = 0

	method peso() = cantLadrillos * 2
	method nivelPeligrosidad() = 2
	method cantLadrillos(_cantLadrillos){
		cantLadrillos = _cantLadrillos
	}
	method pesoEsPar() = self.peso().even()
	method superaPeligrosidad(nivel) = self.nivelPeligrosidad() > nivel
}

object arenaGranel{
	var peso = 0

	method peso() = peso
	method peso(_peso){
		peso = _peso
	} 
	method nivelPeligrosidad() = 1
	method pesoEsPar() = self.peso().even()
	method superaPeligrosidad(nivel) = self.nivelPeligrosidad() > nivel
}

object bateriaAntiaerea{
	var tieneMisiles = true

	method nivelPeligrosidad() = if (self.tieneMisiles()) 100 else 0 
	method peso() = if (self.tieneMisiles()) 300 else 200
	method tieneMisiles() = tieneMisiles
	method tieneMisiles(_tieneMisiles){
		tieneMisiles = _tieneMisiles
	}
	method pesoEsPar() = self.peso().even()
	method superaPeligrosidad(nivel) = self.nivelPeligrosidad() > nivel

//	method cargarMisiles() descargarMisiles crear metodos de carga  y descarga
}

object contenedor {
	const cosas = #{}
	const pesoBase = 100
	
	method peso() =  pesoBase + self.pesoTotal()
	method pesoTotal(){

		return cosas.sum({cosa => cosa.peso()})
	}
	method nivelPeligrosidad() = if (! self.cargaVacia()) self.cosaMasPeligrosa() else 0

	method cargaVacia() = cosas.isEmpty()
	method cosaMasPeligrosa(){

		return self.nivelesDePeligrosidad().max()
	}

	method nivelesDePeligrosidad(){

		return cosas.map({cosa => cosa.nivelPeligrosidad()})
	}
	method pesoEsPar() = self.peso().even()
	method superaPeligrosidad(nivel) = self.nivelPeligrosidad() > nivel
}

object residuos{
	var pesoResiduos = 0

	method peso() = pesoResiduos

	method peso(_peso){
		pesoResiduos = _peso
	} 

	method nivelPeligrosidad() = 200
	method pesoEsPar() = self.peso().even()
	method superaPeligrosidad(nivel) = self.nivelPeligrosidad() > nivel
}

object embalaje{
	var cosa = null
	method peso(){
		return cosa.peso()
	}

	method nivelPeligrosidad(){

		return cosa.nivelPeligrosidad() / 2
	}

	method embalar(obj){
		cosa = obj
	}
	method pesoEsPar() = self.peso().even()
	method superaPeligrosidad(nivel) = self.nivelPeligrosidad() > nivel
}


