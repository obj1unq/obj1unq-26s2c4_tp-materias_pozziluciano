
import estudiante.*

class Materia {
   const property requisitos
   const property cupo
   const listaEspera
   const inscriptos

   method cantInscriptos() {
    return inscriptos.size()
   } 

   method estaEnEspera(unEstudiante) {
        return listaEspera.contains(unEstudiante)
   }

   method avanzarColaDeEspera() {
        if (not listaEspera.isEmpty()) {inscriptos.add(listaEspera.last())
                                        listaEspera.remove(listaEspera.last())}
   }
   method estaListoParaCursar(unEstudiante) {
        return inscriptos.contains(unEstudiante)
   }
   method requisitos() {return requisitos}
   method recibirEstudiante(unEstudiante) {
        if (self.cantInscriptos() == cupo) {listaEspera.add(unEstudiante)} else {inscriptos.add(unEstudiante)}
   }

   method darDeBajaEstudiante(unEstudiante) {
        if (self.estaEnEspera(unEstudiante)) {listaEspera.remove(unEstudiante)} 
        else if (self.estaListoParaCursar(unEstudiante)) {inscriptos.remove(unEstudiante)
                                                          self.avanzarColaDeEspera()}
   }

   method inscriptos() {
    return inscriptos
   }
   
   method listaEspera() {
    return listaEspera
   }
}



const elementosDeProgramación = new Materia(requisitos = [], cupo = 30, listaEspera = [], inscriptos = [])
const matematica1 = new Materia(requisitos = [], cupo = 30, listaEspera = [], inscriptos = 0)
const objetos1 = new Materia(requisitos = [], cupo = 30, listaEspera = [], inscriptos = 0)
const objetos2 = new Materia(requisitos = [objetos1, matematica1], cupo = 30, listaEspera = [], inscriptos = [])
const objetos3 = new Materia(requisitos = [objetos2], cupo = 30, listaEspera = [], inscriptos = [])
const trabajoFinal = new Materia(requisitos = [], cupo = 30, listaEspera = [], inscriptos = [])
const basesDeDatos = new Materia(requisitos = [], cupo = 30, listaEspera = [], inscriptos = [])

const quimica = new Materia(requisitos = [], cupo = 30, listaEspera = [], inscriptos = [])
const biologia1 = new Materia(requisitos = [], cupo = 30, listaEspera = [], inscriptos = [])
const biologia2 = new Materia(requisitos = [biologia1], cupo = 30, listaEspera = [], inscriptos = [])
const anatomiaGeneral = new Materia(requisitos = [], cupo = 30, listaEspera = [], inscriptos = [])

const latin = new Materia(requisitos = [], cupo = 30, listaEspera = [], inscriptos = [])
const derechoRomano = new Materia(requisitos = [], cupo = 30, listaEspera = [], inscriptos = [])
const historiaDelDerechoArgentino = new Materia(requisitos = [], cupo = 30, listaEspera = [], inscriptos = [])
const derechoPenal1 = new Materia(requisitos = [], cupo = 30, listaEspera = [], inscriptos = [])
const derechoPenal2 = new Materia(requisitos = [derechoPenal1], cupo = 30, listaEspera = [], inscriptos = [])
