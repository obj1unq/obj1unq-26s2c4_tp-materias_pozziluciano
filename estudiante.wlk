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

    method inscribirse(unaCarrera) {
        inscripciones.add(unaCarrera)
    }

    method planDeEstudios() {
        return inscripciones.map{carrera => carrera.materias()}.flatten()
    }

}

class Materia {
   
}


object materiaAprobada {
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


const elementosDeProgramación = new Materia()
const matematica1 = new Materia()
const objetos1 = new Materia()
const objetos2 = new Materia()
const objetos3 = new Materia()
const trabajoFinal = new Materia()
const basesDeDatos = new Materia()

const quimica = new Materia()
const biologia1 = new Materia()
const biologia2 = new Materia()
const anatomiaGeneral = new Materia()

const latin = new Materia()
const derechoRomano = new Materia()
const historiaDelDerechoArgentino = new Materia()
const derechoPenal1 = new Materia()
const derechoPenal2 = new Materia()
