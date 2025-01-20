package org.camilob.apiservlet.webapp.headers.repositories;

import org.camilob.apiservlet.webapp.headers.models.Curso;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class CursoRepositorioImpl implements Repository<Curso>{

    private Connection conn;

    public CursoRepositorioImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<Curso> listar() throws SQLException {
        List<Curso> cursos = new ArrayList<>();
        String sql = "SELECT * FROM cursos as c";

        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Curso c = getCurso(rs);
                cursos.add(c);
            }
        }
        return cursos;
    }

    @Override
    public Optional<Curso> porId(Long id) throws SQLException {
        String sql = "SELECT * FROM cursos WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Curso curso = new Curso();
                    curso.setId(rs.getLong("id"));
                    curso.setNombre(rs.getString("nombre"));
                    curso.setDescripcion(rs.getString("descripcion"));
                    curso.setInstructor(rs.getString("instructor"));
                    curso.setDuracion(rs.getDouble("duracion"));
                    return Optional.of(curso);
                }
            }
        }
        return Optional.empty();
    }

    @Override
    public List<Curso> porNombre(String nombre) throws SQLException {
        if (nombre == null || nombre.trim().isEmpty()) {
            throw new IllegalArgumentException("El nombre del curso no puede ser nulo o vacío.");
        }
        List<Curso> cursos = new ArrayList<>();
        String sql = "SELECT * FROM cursos as c WHERE c.nombre like ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, "%" + nombre + "%");
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Curso c = getCurso(rs);
                    cursos.add(c);
                }
            }
        }
        return cursos;
    }

    @Override
    public void guardar(Curso curso) throws SQLException {

        String sql;
        if (curso.getId() != null && curso.getId() > 0) {
            sql = "update cursos set nombre=?, descripcion=?, instructor=?, duracion=? where id=?";
        } else {
            sql = "insert into cursos (nombre, descripcion, instructor, duracion) values (?,?,?,?)";
        }
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, curso.getNombre());
            stmt.setString(2, curso.getDescripcion());
            stmt.setString(3, curso.getInstructor());
            stmt.setDouble(4, curso.getDuracion());

            if (curso.getId() != null && curso.getId() > 0) {
                stmt.setLong(5, curso.getId());
            }
            stmt.executeUpdate();
        }

    }

    @Override
    public void eliminar(Long id) throws SQLException {
        String sql = "delete from cursos where id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, id);
            stmt.executeUpdate();
        }
    }

    private static Curso getCurso(ResultSet rs) throws SQLException {
        Curso c = new Curso();
        c.setId(rs.getLong("id"));
        c.setNombre(rs.getString("nombre"));
        c.setDescripcion(rs.getString("descripcion"));
        c.setInstructor(rs.getString("instructor"));
        c.setDuracion(rs.getDouble("duracion"));
        return c;
    }
}
