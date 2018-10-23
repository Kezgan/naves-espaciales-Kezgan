class NaveEspacial {
	var velocidad = 0
	var direccion = 0
	var property combustible = 100
	
	method acelerar(cuanto) {
		velocidad = velocidad + cuanto
		velocidad = velocidad.min(100000)
	}
	
	method desacelerar(cuanto) {
		velocidad = velocidad - cuanto
		velocidad = velocidad.max(0)
	}
	
	method irHaciaElSol() {
		direccion = 10
	}
	
	method escaparDelSol() {
		direccion = -10
	}
	
	method ponerseParaleloAlSol() {
		direccion = 0
	}
	
	method alejarseUnPocoDelSol() {
		direccion = direccion - 1
		direccion = direccion.max(-10)
	}
	
	method acercarseUnPocoAlSol() {
		direccion = direccion + 1
		direccion = direccion.min(10)
	}
	
	method cargarCombustible(_combustible) {
		combustible = combustible + _combustible
	}
	
	method descargarCombustible(_combustible) {
		combustible = combustible - _combustible
		combustible = combustible.max(0)
	}
	
	method prepararViaje() {
		self.cargarCombustible(30000)
		self.acelerar(5000)
	}
}

class NavesBaliza inherits NaveEspacial {
	var color
	
	constructor(_colorDeBaliza) {
		color = _colorDeBaliza
	}
	
	method color() {
		return color
	}
	
	method cambiarColorDeBaliza(_colorNuevo) {
		color = _colorNuevo
	}
	
	override method prepararViaje() {
		color = "Verde"
		self.ponerseParaleloAlSol()
		super()
	}
}

class NavesDePasajeros inherits NaveEspacial {
	var pasajeros
	var comida = 0
	var bebida = 0
	
	constructor(_pasajeros) {
		pasajeros = _pasajeros
	}
	
	method cantidadPasajeros() {
		return pasajeros
	}
	
	method cargarComida(_comida) {
		comida = comida + _comida
	}
	
	method descargarComida(_comida) {
		comida = comida - _comida
		comida = comida.max(0)
	}
	
	method cargarBebida(_bebida) {
		bebida = bebida + _bebida
	}
	
	method descargarBebida(_bebida) {
		bebida = bebida - _bebida
		bebida = bebida.max(0)
	}
	
	override method prepararViaje() {
		self.cargarComida(4 * pasajeros)
		self.cargarBebida(6 * pasajeros)
		self.acercarseUnPocoAlSol()
		super()
	}
}

class NavesDeCombate inherits NaveEspacial {
	var invisible = false
	var misiles = false
	var mensaje = []
	
	
	method ponerseVisible() {
		invisible = false
	}
	
	method ponerseInvisible() {
		invisible = true
	}
	
	method estaInvisible() {
		return invisible
	}
	
	method desplegarMisiles() {
		misiles = true
	}
	
	method replegarMisiles() {
		misiles = false
	}
	
	method esDesplegado() {
		return misiles
	}
	
	method misilesDesplegados() {
		return misiles
	}
	
	method emitirMensaje(_mensaje) {
		return mensaje.add(_mensaje)
	}
	
	method mensajesEmitidos() {
		return mensaje
	}
	
	method primerMensajeEmitido() {
		return mensaje.first()
	}
	
	method ultimoMensajeEmitido() {
		return mensaje.last()
	}
	
	method esEscueta() {
		return mensaje.all({msg => msg.length() < 30})
	}
	
	method emitioMensaje(_mensaje) {
		return mensaje.contains(_mensaje)
	}
	
	override method prepararViaje() {
		self.ponerseVisible()
		self.replegarMisiles()
		self.acelerar(15000)
		self.emitirMensaje("Saliendo en mision")
		super()
	}
}