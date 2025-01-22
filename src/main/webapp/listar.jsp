<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="layout/header.jsp"/>

<h2 class="mt-5">Filtrador de Cursos</h2>
<form action="${pageContext.request.contextPath}/cursos/buscar" method="post" class="d-flex mb-3">
    <input type="text" id="buscar" name="nombre" placeholder="Introduce nombre del curso" class="form-control me-2">
    <button class="btn btn-primary" type="submit">Buscar</button>
</form>
<a href="${pageContext.request.contextPath}/cursos/form" class="btn btn-success mb-3">Crear [+]</a>

<h3>Tabla de Cursos</h3>
<table class="table table-striped table-bordered">
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
                        <div class="d-flex gap-2">
                            <a href="${pageContext.request.contextPath}/cursos/form?id=${curso.id}"
                               class="btn btn-warning btn-sm">Editar</a>
                            <a href="${pageContext.request.contextPath}/cursos/eliminar?id=${curso.id}"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('¿Está seguro que desea eliminar?');">Eliminar</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="6" class="text-center">No se encontraron cursos.</td>
            </tr>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
<jsp:include page="layout/footer.jsp"/>