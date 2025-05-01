/** First Wollok example */
import wollok.game.*

object lionel {
	
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
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method pelotaPateada() {
		position = game.at((game.width() - 1).min(position.x() + 3), position.y()) 
	}
}

// Patear: Hacer que Lionel patee la pelota al apretar la tecla p: La pelota se desplaza 3 posiciones a la derecha 
//(o lo máximo que se pueda antes de salir de pantalla). 
//Tip: usar el método min de los números entre el x actual de la pelota + 3 y el ancho del tablero - 1. 
//Validar que la pelota se encuentre en la misma posicion que Lionel
