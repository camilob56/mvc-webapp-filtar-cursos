<%@ page contentType="text/html" pageEncoding="UTF-8" import="org.camilob.apiservlet.webapp.headers.models.*" %>
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

        .button {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            text-decoration: none;
            font-weight: bold;
            border-radius: 4px;
            display: inline-block;
            text-align: center;
        }

        .button:hover {
            background-color: #45a049;
        }

        .button-danger {
            background-color: #f44336;
            text-decoration: none;
            font-weight: bold;
            border-radius: 4px;
        }

        .button-danger:hover {
            background-color: #d32f2f;
        }

        .button-blue {
            background-color: #007BFF;
        }

        .button-blue:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>

<h1>Filtrador de Cursos</h1>

<form action="<%=request.getContextPath()%>/cursos/buscar" method="post">
    <input type="text" id="buscar" name="nombre" placeholder="Introduce nombre del curso"/>
    <button class="button" type="submit">Buscar</button>
</form>
<p>
    <a href="<%=request.getContextPath()%>/cursos/form" class="button button-blue">Crear [+]</a>
</p>
<h2>Tabla de Cursos</h2>
<table>
    <thead>
    <tr>
        <th>Id</th>
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
        <td><%= curso.getId() %>
        </td>
        <td><%= curso.getNombre() %>
        </td>
        <td><%= curso.getDescripcion() %>
        </td>
        <td><%= curso.getInstructor() %>
        </td>
        <td><%= curso.getDuracion() %>
        </td>
        <td>
            <a href="<%=request.getContextPath()%>/cursos/form?id=<%=curso.getId()%>" class="button">Editar</a>
        </td>
        <td>
            <a href="<%=request.getContextPath()%>/cursos/eliminar?id=<%=curso.getId()%>"
               class="button button-danger"
               onclick="return confirm('¿Está seguro que desea eliminar?');">
                Eliminar
            </a>
        </td>
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
