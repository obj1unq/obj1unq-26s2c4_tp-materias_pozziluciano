import materia.*
import inscripcionesYAprobadas.*


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

