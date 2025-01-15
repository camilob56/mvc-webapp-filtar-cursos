package org.camilob.apiservlet.webapp.headers.repositories;

import org.camilob.apiservlet.webapp.headers.models.Curso;

import java.sql.SQLException;
import java.util.List;

public interface Repository<T> {

    List<Curso> listar() throws SQLException;;
    List<Curso> porNombre(String nombre) throws SQLException;;

}
