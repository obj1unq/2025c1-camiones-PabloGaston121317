object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
	method superaPeligrosidad(nivel) = self.nivelPeligrosidad() > nivel
	method pesoEsPar() = self.peso().even()
	method bulto() = 1
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
	method bulto() = 2
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
	method bulto() = self.cantDeBultoPor(cantLadrillos)

	method cantDeBultoPor(ladrillos){
		if(ladrillos <= 100)
			return 1
			else if(ladrillos.between(101, 300))
				return 2
				else return 3
	}
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
	method bulto() = 1
}

object bateriaAntiaerea{
	var misilesCargados = true

	method nivelPeligrosidad() = if (self.misilesCargados()) 100 else 0 
	method peso() = if (self.misilesCargados()) 300 else 200
	method misilesCargados() = misilesCargados
	method cargarMisiles(){
		misilesCargados = true
	}
	method descargarMisiles(){
		misilesCargados = false
	}
	method pesoEsPar() = self.peso().even()
	method superaPeligrosidad(nivel) = self.nivelPeligrosidad() > nivel
	method bulto() = if (misilesCargados) 2 else 1


}

object contenedor {
	const cosas = #{}
	const pesoBase = 100
	
	method cargar(cosa){
		cosas.add(cosa)
	}
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
	method bulto() = 1
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
	method bulto() = 1
}


