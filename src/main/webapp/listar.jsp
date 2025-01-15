<%@ page contentType="text/html" pageEncoding="UTF-8" import="org.camilob.apiservlet.webapp.headers.models.*"%>
<%@ page import="java.util.List" %>
<%
    List<Curso> cursos = (List<Curso>) request.getAttribute("cursos");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tarea 9: Filtrando Cursos</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        input[type="text"] {
            padding: 8px;
            margin-right: 10px;
        }
        button {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<h1>Tarea 9: Filtrando Cursos</h1>

<form action="<%=request.getContextPath()%>/cursos/buscar" method="post">
    <label for="buscar">Buscar por nombre:</label>
    <input type="text" id="buscar" name="nombre" placeholder="Introduce nombre del curso" />
    <button type="submit">Buscar</button>
</form>

<h2>Lista de Cursos</h2>
<table>
    <thead>
    <tr>
        <th>Nombre</th>
        <th>Descripción</th>
        <th>Instructor</th>
        <th>Duración (horas)</th>
    </tr>
    </thead>
    <tbody>
    <%
        if (cursos != null && !cursos.isEmpty()) {
            for (Curso curso : cursos) {
    %>
    <tr>
        <td><%= curso.getNombre() %></td>
        <td><%= curso.getDescripcion() %></td>
        <td><%= curso.getInstructor() %></td>
        <td><%= curso.getDuracion() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="4">No se encontraron cursos.</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
