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
		<div class="containerCarrouselIndex" id="s"></div>
		<div></div>
		<script type="text/javascript">
		
		let imagesCarrousel2 = ["https://i.ibb.co/qLGyVbk/872716.jpg",
			"https://i.ibb.co/sCjMDyj/1043977.jpg",
			"https://i.ibb.co/TcZ3cYp/475841.jpg",
			"https://i.ibb.co/PjMDWkC/562774.jpg"]

			let contador = 0;
			let tamaño   = imagesCarrousel2.length;
			console.log(tamaño)

			const carrusel = document.getElementById("s");

			window.addEventListener('DOMContentLoaded', () => {
			   setInterval(()=>{
				if(contador<tamaño){
					let uno = 'url(';
					let dos = imagesCarrousel2[contador];
					let tres = ')';
					let sumatoria = uno + dos +tres;
					
					carrusel.style.backgroundImage = sumatoria;
					contador++;
				} else {
					contador = 0;
				}
				
				
			},5000)
			});
		
		</script>
	</main>
</body>
</html>