<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de cursos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            max-width: 400px;
            width: 100%;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-right: 20px;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 1.8em;
        }
        form {
            text-align: left;
        }
        form div {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            font-size: 12px;
            font-weight: bold;
            text-transform: uppercase;
        }
        .volver-button {
            background-color: #f44336;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            margin-top: 20px;
            width: 93%;
        }

        .volver-button:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Formulario de cursos</h1>
    <form action="${pageContext.request.contextPath}/cursos/form" method="post">
        <div>
            <label for="nombre">Nombre:</label>
            <div>
                <input type="text" id="nombre" name="nombre" value="${curso.nombre != null ? curso.nombre : ''}">
            </div>
            <c:if test="${errores != null && errores.nombre != null}">
                <div class="error">${errores.nombre}</div>
            </c:if>
        </div>
        <div>
            <label for="descripcion">Descripción:</label>
            <div>
                <input type="text" id="descripcion" name="descripcion" value="${curso.descripcion != null ? curso.descripcion : ''}">
            </div>
            <c:if test="${errores != null && errores.descripcion != null}">
                <div class="error">${errores.descripcion}</div>
            </c:if>
        </div>
        <div>
            <label for="instructor">Instructor:</label>
            <div>
                <input type="text" id="instructor" name="instructor" value="${curso.instructor != null ? curso.instructor : ''}">
            </div>
            <c:if test="${errores != null && errores.instructor != null}">
                <div class="error">${errores.instructor}</div>
            </c:if>
        </div>
        <div>
            <label for="duracion">Duración:</label>
            <div>
                <input type="text" name="duracion" id="duracion" value="${curso.duracion != 0 ? curso.duracion : ''}">
            </div>
            <c:if test="${errores != null && errores.duracion != null}">
                <div class="error">${errores.duracion}</div>
            </c:if>
        </div>
        <div>
            <input type="submit" value="${curso.id != null && curso.id > 0 ? 'Editar' : 'Guardar'}">
        </div>
        <div>
            <a href="${pageContext.request.contextPath}" class="volver-button">Volver</a>
        </div>
        <input type="hidden" name="id" value="${curso.id}">
    </form>
</div>
</body>
</html>
