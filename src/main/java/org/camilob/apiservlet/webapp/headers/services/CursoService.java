package org.camilob.apiservlet.webapp.headers.services;

import org.camilob.apiservlet.webapp.headers.models.Curso;

import java.util.List;
import java.util.Optional;

public interface CursoService {

    List<Curso> listar();
    Optional<Curso> porId(Long id);
    List<Curso> porNombre(String nombre);
    void guardar(Curso curso);
    void eliminar(Long id);
}
