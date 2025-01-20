package org.camilob.apiservlet.webapp.headers.services;

import org.camilob.apiservlet.webapp.headers.models.Curso;
import org.camilob.apiservlet.webapp.headers.repositories.CursoRepositorioImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class CursoServiceImpl implements CursoService{

    private CursoRepositorioImpl repository;

    public CursoServiceImpl(Connection conn) {
        this.repository = new CursoRepositorioImpl(conn);
    }

    @Override
    public List<Curso> listar(){
        try {
            return repository.listar();
        } catch (SQLException throwables) {
            throw new ServiceJdbcException(throwables.getMessage(), throwables.getCause());
        }
    }

    @Override
    public Optional<Curso> porId(Long id) {
        try {
            return repository.porId(id);
        } catch (SQLException e) {
            throw new ServiceJdbcException(e.getMessage(), e.getCause());
        }
    }

    @Override
    public List<Curso> porNombre(String nombre){
        try {
            List<Curso> cursos = repository.porNombre(nombre);
            return cursos.isEmpty() ? List.of() : cursos;
        } catch (SQLException throwables) {
            throw new ServiceJdbcException(throwables.getMessage(), throwables.getCause());
        }
    }

    @Override
    public void guardar(Curso curso) {
        try {
            repository.guardar(curso);
        } catch (SQLException throwables) {
            throw new ServiceJdbcException(throwables.getMessage(), throwables.getCause());
        }
    }

    @Override
    public void eliminar(Long id) {
        try {
            repository.eliminar(id);
        } catch (SQLException throwables) {
            throw new ServiceJdbcException(throwables.getMessage(), throwables.getCause());
        }
    }
}
