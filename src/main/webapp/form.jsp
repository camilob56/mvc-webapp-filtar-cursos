<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="layout/header.jsp"/>

<h1 class="mb-4">Formulario de Cursos</h1>

<form action="${pageContext.request.contextPath}/cursos/form" method="post" class="row g-3">
    <div class="col-md-6">
        <label for="nombre" class="form-label">Nombre:</label>
        <input type="text" id="nombre" name="nombre" value="${curso.nombre != null ? curso.nombre : ''}" class="form-control">
        <c:if test="${errores != null && errores.nombre != null}">
            <div class="text-danger">${errores.nombre}</div>
        </c:if>
    </div>

    <div class="col-md-6">
        <label for="descripcion" class="form-label">Descripción:</label>
        <input type="text" id="descripcion" name="descripcion" value="${curso.descripcion != null ? curso.descripcion : ''}" class="form-control">
        <c:if test="${errores != null && errores.descripcion != null}">
            <div class="text-danger">${errores.descripcion}</div>
        </c:if>
    </div>

    <div class="col-md-6">
        <label for="instructor" class="form-label">Instructor:</label>
        <input type="text" id="instructor" name="instructor" value="${curso.instructor != null ? curso.instructor : ''}" class="form-control">
        <c:if test="${errores != null && errores.instructor != null}">
            <div class="text-danger">${errores.instructor}</div>
        </c:if>
    </div>

    <div class="col-md-6">
        <label for="duracion" class="form-label">Duración:</label>
        <input type="text" name="duracion" id="duracion" value="${curso.duracion != 0 ? curso.duracion : ''}" class="form-control">
        <c:if test="${errores != null && errores.duracion != null}">
            <div class="text-danger">${errores.duracion}</div>
        </c:if>
    </div>

    <div class="col-12">
        <button type="submit" class="btn btn-primary">${curso.id != null && curso.id > 0 ? 'Editar' : 'Guardar'}</button>
        <a href="${pageContext.request.contextPath}" class="btn btn-secondary">Volver</a>
    </div>
    <input type="hidden" name="id" value="${curso.id}">
</form>
<jsp:include page="layout/footer.jsp"/>