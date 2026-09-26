import materia.*
import estudiante.*

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
