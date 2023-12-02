/** Start Wars */
class Nave{
	var vida
	method vida() = vida
	
	method destruirse() {vida = 0}
	
	method aumentarVida(_vida) {
		vida = vida + _vida
	}
	
	method habilidadEspecial(){
		
	}
	
	method ataque()
	
	method puedeConquistarPlaneta(unPlaneta) = self.ataque() > unPlaneta.defensa()
	
	method atacarPlaneta(unPlaneta) {
		if( self.puedeConquistarPlaneta(unPlaneta) ){
			unPlaneta.cambiarinfluencia()
		}else{
			self.destruirse()
		}
	}
}

class Tie inherits Nave{
	const ataque = 100
	override method ataque() = ataque
	method esRapido() = true
	method esPesado() = false
	
}
class TiePesado inherits Nave{
	const ataque = 50
	override method ataque() = ataque
	method esRapido() = false
	method esPesado() = true
	override method habilidadEspecial(){
		self.aumentarVida(150)
	}
}
class NaveDeTransporte inherits Nave {
	var cantDePasajeros
	method esRapido() = cantDePasajeros < 5 
	method esPesado() = true
	method eyectarTodosLosPasajeros(){cantDePasajeros = 0 }
	override method habilidadEspecial(){
	if (cantDePasajeros > 0 ){ self.eyectarTodosLosPasajeros() }
 }
}
class EstrellaDeLaMuerte{
	const listaDeNaves = []
	var vida = 4000
	var ataque = 0
	method esRapido() = false 
	method esPesado() = true
	method agregarNave(unaNave){
		listaDeNaves.add(unaNave)
	}
	method habilidadEspecial(){
		ataque += 500
		vida -=500
		self.activarHabilidadDenavesrapidas()
	}
	method activarHabilidadDenavesrapidas(){
		self.buscarNavesRapidas().forEach({nave => nave.habilidadEspecial()})
	}
	method buscarNavesRapidas() = listaDeNaves.filter({nave => nave.esRapido()})
		
}
class Planeta{
	const cantPoblacion
	var estaBajoLaInfluenciaDelImperio = false
	method estaBajoLaInfluenciaDelImperio() = estaBajoLaInfluenciaDelImperio
	method cambiarinfluencia(){
		estaBajoLaInfluenciaDelImperio = true
	}
	method defensa() = cantPoblacion * 2
}
const planeta1 = new Planeta(cantPoblacion = 2)
