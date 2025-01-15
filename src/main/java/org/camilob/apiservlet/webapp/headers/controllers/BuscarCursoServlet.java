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
import java.util.List;

@WebServlet("/buscarCurso")
public class BuscarCursoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombreCurso = req.getParameter("nombre");
        Connection conn = (Connection) req.getAttribute("conn");
        CursoService cursoService = new CursoServiceImpl(conn);
        List<Curso> cursos = cursoService.porNombre(nombreCurso);
        req.setAttribute("cursos", cursos);
        getServletContext().getRequestDispatcher("/listar.jsp").forward(req, resp);
    }
}
