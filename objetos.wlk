/** First Wollok example */
import wollok.game.*

object lionel {

	const tiempoLevantamiento = 2000
	const alturaLevantada = 1	
	var property position = game.at(3,5)
	var property bocha = pelota
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
	method patear() {
		if (self.validarPosicion()) {
             bocha.pelotaPateada()
		}
	}

	method validarPosicion() {
		return self.position() == bocha.position() 
	}

	method irHaciaPelota() {
		bocha.position()
	}

	method taquito(){
		self.validarTaquito()
		bocha.position(game.at(self.siguienteEnX(), bocha.position().y()))
	}

	method validarTaquito(){
		if (bocha.position() != position){
			self.error("¡No tengo la bocha!  ")
		}
	}

	method siguienteEnX(){
		return 0.max(bocha.position().x() -2)
	}
	method validarLevantarla(){
		if(bocha.position() != position){
			self.error("No se puede levantar la pelota si no se esta sobre ella.")
		}
		if(bocha.position().y() >= game.height() - 1){
			self.error("No se puede levantar la pelota fuera de la cuadricula.")
		}
	}

	method levantarla() {
		self.validarLevantarla()
		bocha.subir(alturaLevantada)
		game.schedule(
			tiempoLevantamiento,
			{ bocha.bajar(alturaLevantada) }
		)
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method pelotaPateada() {
		position = game.at((game.width() - 1).min(position.x() + 3), position.y()) 
	}

	method subir(celdas){
		position = position.up(celdas)
	}

	method bajar(celdas){
		position = position.down(celdas)
	}
}

