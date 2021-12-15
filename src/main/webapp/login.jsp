<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./partials/head.jsp"></jsp:include>

</head>
<body>

	<div class="col-lg-5 mx-auto p-3 py-md-5 marginCorrector">

		<main class="row">
			<h1 class="text-center logo" >Agencia "Sin Culpa"</h1>


			<c:if test="${flash != null}">
				<div class="alert alert-danger">
					<p>
						<c:out value="${flash}" />
					</p>
				</div>
			</c:if>
		</main>
		<div class="container row">
				<div class="col" style="min-width:50%;min-height: 100%; background: #0d6efd;border-radius: 20px;">
				<img style="margin-left:-450px" alt="" src="https://i.ibb.co/sFdwMrD/Sin-t-tulo.png">
				 </div>
				<div class="col h-75"  style="min-width:50%;min-height: 100%;">
					<form action="login" method="post">

						<div class="mb-3">
							<label for="username" class="form-label">Usuario</label> <input
								class="form-control" name="username">
						</div>

						<div class="mb-3">
							<label for="password" class="form-label">Contraseña</label> <input
								type="password" class="form-control" name="password">
						</div>

						<div class="d-grid gap-2">
							<button type="submit" class="btn btn-lg btn-primary">Ingresar</button>
						</div>
					</form>
				</div>
			</div>
		
	</div>
</body>
</html>