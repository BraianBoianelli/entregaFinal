<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<jsp:include page="/partials/head.jsp"></jsp:include>


</head>
<body>
	<jsp:include page="/partials/nav.jsp"></jsp:include>
	<main class="container">
		<div class="bg-light p-4 rounded">

			<h1>
				¡Bienvenido,
				<c:out value="${user.username2()}" />
				!
			</h1>
		</div>
		
		<div style="position: absolute;">
		<div class="containerCarrouselIndex s1" style="position: absolute;z-index: 1;" id="s1"></div>
		<div class="containerCarrouselIndex s2" style="position: absolute;z-index: 2;" id="s2"></div>
		</div>
		<script type="text/javascript">
		let imagesCarrousel2 = ["https://i.ibb.co/qLGyVbk/872716.jpg",
			"https://i.ibb.co/sCjMDyj/1043977.jpg",
			"https://i.ibb.co/TcZ3cYp/475841.jpg",
			"https://i.ibb.co/PjMDWkC/562774.jpg",
			"https://i.ibb.co/8mKXWsZ/Screenshot-20211214-102135-3.png"]

		let contador = 0;
		let tamaño = imagesCarrousel2.length;

		function setearOpacity(indentificador) {

			for (let opacity = 1; opacity > 0; opacity -= 0.1) {
				indentificador.style.opacity = opacity;
			}
			opacity = 1;
		}

		function espar(contador) {
			return contador % 2 == 0;
		}

		const carrusel1 = document.getElementById("s1");
		const carrusel2 = document.getElementById("s2");
		var status = 1;
		window.addEventListener('DOMContentLoaded', () => {

			setInterval(() => {
				
				
				
				if (!espar(contador)) {
					let uno = 'url(';
					let dos = imagesCarrousel2[contador + 1];
					let tres = ')';
					let sumatoria = uno + dos + tres;
					
					
					console.log("El recurso correspondiente es "+imagesCarrousel2[contador + 1]+ 
							" corresponde al lugar "+ (contador+1) + " da por resultado "
							+sumatoria);
					
					carrusel2.style.backgroundImage = sumatoria;
					carrusel2.style.opacity = 1;
					setearOpacity(carrusel1);
					carrusel1.style.zIndex = 1;
					carrusel2.style.zIndex = 3;
					contador = contador + 1;
					
				

				} else {
					console.log(contador + " es par")
					let uno = 'url(';
					let dos = imagesCarrousel2[contador + 1];
					let tres = ')';
					let sumatoria = uno + dos + tres;
					console.log("El recurso correspondiente es "+imagesCarrousel2[contador + 1]+ 
							" corresponde al lugar "+ (contador+1) + " da por resultado "
							+sumatoria);
					carrusel1.style.backgroundImage = sumatoria;
					carrusel1.style.opacity = 1;
					setearOpacity(carrusel2);
					carrusel2.style.zIndex = 1;
					carrusel1.style.zIndex = 3;
					contador = contador + 1;
					status = 1;
					
				}

			}, 5000)
		});
		
		</script>
	</main>
</body>
</html>