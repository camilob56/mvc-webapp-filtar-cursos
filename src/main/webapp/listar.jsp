<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

<form action="${pageContext.request.contextPath}/cursos/buscar" method="post">
    <input type="text" id="buscar" name="nombre" placeholder="Introduce nombre del curso"/>
    <button class="button" type="submit">Buscar</button>
</form>
<p>
    <a href="${pageContext.request.contextPath}/cursos/form" class="button button-blue">Crear [+]</a>
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
        <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${not empty cursos}">
            <c:forEach var="curso" items="${cursos}">
                <tr>
                    <td>${curso.id}</td>
                    <td>${curso.nombre}</td>
                    <td>${curso.descripcion}</td>
                    <td>${curso.instructor}</td>
                    <td>${curso.duracion}</td>
                    <td>
                        <div style="display: flex; gap: 10px;">
                            <a href="${pageContext.request.contextPath}/cursos/form?id=${curso.id}" class="button">Editar</a>
                            <a href="${pageContext.request.contextPath}/cursos/eliminar?id=${curso.id}"
                               class="button button-danger"
                               onclick="return confirm('¿Está seguro que desea eliminar?');">
                                Eliminar
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="6">No se encontraron cursos.</td>
            </tr>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

</body>
</html>
