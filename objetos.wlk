/** First Wollok example */
import wollok.game.*

object lionel {

	var property bocha = pelota
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
	method taquito(){
		self.validarTaquito()
		bocha.position(game.at(self.siguienteEnX(), bocha.position().y()))
	}

	method validarTaquito(){
		if (bocha.position() != position){
			self.error("¡Lio no tiene la bocha!  ")
		}
	}

	method siguienteEnX(){
		return 0.max(bocha.position().x() -2)
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}

/* 30/4


*/