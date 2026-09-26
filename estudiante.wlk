class Estudiante {
    const property inscripciones
    const property carreras 
    const aprobadas

    method recibirCertificado(unCertificado) {
        aprobadas.add(unCertificado) 
    }

    method materiasDelAlumno() {
        return aprobadas.map{certificado => certificado.materia()}
    }

    method tieneAprobada(unaMateria) {
        return self.materiasDelAlumno().contains(unaMateria)
    }

    method cantAprobadas() {
        return aprobadas.count()
    }

    method promedio() {
        return aprobadas.average{certificado => certificado.nota()}
    }

    method entrarA(unaCarrera) {
        carreras.add(unaCarrera)
    }

    method inscribirse(unaMateria) {
        self.validarQueEsEnUnaDeLasCarreras(unaMateria)
        self.validarQueNoEstaYaAprobada(unaMateria)
        self.validarQueNoEstaYaInscripto(unaMateria)
        self.validarLosRequisitosAprobados(unaMateria)
        unaMateria.recibirEstudiante(self)
        inscripciones.add(unaMateria)
    }

    method planDeEstudios() {
        return carreras.map{carrera => carrera.materias()}.flatten()
    }

    method materiasDondeEstaEsperando() {
        return self.planDeEstudios().filter{materia => materia.estaEnEspera(self)}
    }

     method materiasDondeYaEntroALaComision() {
        return self.planDeEstudios().filter{materia => materia.estaListoParaCursar(self)}
    }

    method validarQueEsEnUnaDeLasCarreras(unaMateria) {
        return if (not self.planDeEstudios().contains(unaMateria)) {self.error("esa Materia no corresponde a ninguna de las carreras a las que se inscribio este estudiante")}
    }

    method validarQueNoEstaYaAprobada(unaMateria) {
        return if (self.tieneAprobada(unaMateria)) {self.error("esta materia ya fue aprobada por este estudiante")}
    } 

    method validarQueNoEstaYaInscripto(unaMateria) {
        return if (inscripciones.contains(unaMateria)) {self.error("el estudiante ya esta inscripto en esta materia")}
    }

    method validarLosRequisitosAprobados(unaMateria) {
        return if (not unaMateria.requisitos().all{requisito => self.tieneAprobada(requisito)}) {self.error("el estudiante no aprobo los requisitos necesarios para esta materia")}
    }
}

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

object gestorDeInscripciones {
    method estudiantesInscriptos(unaMateria) {
        return unaMateria.inscriptos()
    }

    method estudiantesEnEspera(unaMateria) {
        return unaMateria.listaEspera()
    }
} 

object gestorMateriasAprobadas {
    method registrarAprobacion(unEstudiante, unaMateria, unaNota) {
        if (not unEstudiante.tieneAprobada(unaMateria))
        { const nuevoCertificado = new Certificado(materia = unaMateria, nota = unaNota, estudiante = unEstudiante) 
          unEstudiante.recibirCertificado(nuevoCertificado) } else {self.error("el alumno" + unEstudiante + "ya aprobo previamente" + unaMateria)}
    }
}


class Certificado {
    const property materia
    const property nota
    const property estudiante

    method materia() {return materia}
    method nota() {return nota}
    method estudiante() {return estudiante}
}

class Carrera {
    const property materias
}

const programacion = new Carrera(materias = [elementosDeProgramación, matematica1, objetos1, objetos2, objetos3, trabajoFinal, basesDeDatos])
const medicina = new Carrera(materias = [quimica, biologia1, biologia2, anatomiaGeneral])
const derecho = new Carrera(materias = [latin, derechoRomano, historiaDelDerechoArgentino, derechoPenal1, derechoPenal2])


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
