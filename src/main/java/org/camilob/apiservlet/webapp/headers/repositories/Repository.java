package org.camilob.apiservlet.webapp.headers.repositories;

import org.camilob.apiservlet.webapp.headers.models.Curso;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface Repository<T> {

    List<Curso> listar() throws SQLException;;
    Optional<Curso> porId(Long id) throws SQLException;
    List<Curso> porNombre(String nombre) throws SQLException;;
    void guardar(T t) throws SQLException;
    void eliminar(Long id) throws SQLException;
}
