package org.camilob.apiservlet.webapp.headers.services;

import org.camilob.apiservlet.webapp.headers.models.Curso;

import java.util.List;

public interface CursoService {

    List<Curso> listar();
    List<Curso> porNombre(String nombre);

}
