package org.camilob.apiservlet.webapp.headers.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.camilob.apiservlet.webapp.headers.models.Curso;
import org.camilob.apiservlet.webapp.headers.services.CursoService;
import org.camilob.apiservlet.webapp.headers.services.CursoServiceImpl;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@WebServlet("/cursos/form")
public class CursoFormServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        CursoService service = new CursoServiceImpl(conn);

        Long id;
        try {
            id = Long.valueOf(req.getParameter("id"));
        } catch (NumberFormatException e){
            id = 0L;
        }

        Curso curso = new Curso();
        if (id > 0){
            Optional<Curso> o = service.porId(id);
            if (o.isPresent()){
                curso = o.get();
            }
        }

        req.setAttribute("curso", curso);
        getServletContext().getRequestDispatcher("/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection conn = (Connection) req.getAttribute("conn");
        CursoService service = new CursoServiceImpl(conn);

        String nombre = req.getParameter("nombre");
        String descripcion = req.getParameter("descripcion");
        String instructor = req.getParameter("instructor");
        String duracionStr = req.getParameter("duracion");

        Long id = null;
        try {
            id = Long.valueOf(req.getParameter("id"));
        } catch (NumberFormatException e) {
            id = 0L;
        }

        Map<String, String> errores = new HashMap<>();
        if (nombre == null || nombre.isBlank()) {
            errores.put("nombre", "El nombre es requerido!");
        }
        if (descripcion == null || descripcion.isBlank()) {
            errores.put("descripcion", "La descripción es requerida!");
        }
        if (instructor == null || instructor.isBlank()) {
            errores.put("instructor", "El instructor es requerido!");
        }
        Double duracion = 0.0;
        try {
            duracion = Double.valueOf(duracionStr);
            if (duracion <= 0) {
                errores.put("duracion", "La duración debe ser mayor a 0!");
            }
        } catch (NumberFormatException e) {
            errores.put("duracion", "La duración debe ser un número válido!");
        }

        Curso curso = new Curso();
        curso.setId(id);
        curso.setNombre(nombre);
        curso.setDescripcion(descripcion);
        curso.setInstructor(instructor);
        curso.setDuracion(duracion);

        if (errores.isEmpty()) {
            service.guardar(curso);
            resp.sendRedirect(req.getContextPath() + "/cursos");
        } else {
            req.setAttribute("errores", errores);
            req.setAttribute("curso", curso);
            getServletContext().getRequestDispatcher("/form.jsp").forward(req, resp);
        }
    }
}
