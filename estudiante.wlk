class Estudiante {
    const property inscripciones
    const property carreras 
    const aprobadas

    method recibirCertificado(unCertificado) {
        aprobadas.add(unCertificado) 
    }
}

class Materia {
    const property carrera
}


object materiaAprobada {
    method registrarAprobacion(unEstudiante, unaMateria, unaNota) {
        const nuevoCertificado = new Certificado(materia = unaMateria, nota = unaNota, estudiante = unEstudiante) 
        unEstudiante.recibirCertificado(nuevoCertificado)
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
    
}

const programacion = new Carrera()
const medicina = new Carrera()
const derecho = new Carrera()