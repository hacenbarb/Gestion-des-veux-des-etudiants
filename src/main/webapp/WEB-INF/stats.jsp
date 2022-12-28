
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stats</title>
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/index.css">
</head>
<body>
	<div class="wrapper expanded">
		<aside class="hidden">
			<div class="aside_header">
				<h1>Menu</h1>
			</div>
			<div class="aside_links">
				<ul>
					<li><a href="index">Etudaints</a></li>
					<li><a href="ViewStats">Stats</a></li>
				</ul>
			</div>

			<div class="aside_options">
				<form method="post" action="Logout">
					<button>Logout</button>
				</form>
			</div>
		</aside>
		<div class="container">
			<div class="navbar">
				<div class="collapse-button">
					<button type="button" id="sidebarToggler">
						<span></span><span></span><span></span>
					</button>
				</div>
				<div>
					<p class="navbar_info">
						Connected as : <span>${sessionScope.connected}</span>
					</p>
				</div>
			</div>
			<div class="content">
				<div class="header">
					<h1>View Stats</h1>
				</div>
				<div id="chartData" style="display: none">
					<c:if test="${!empty stats}">
						<c:forEach var="i" begin="0" end="${stats.size()-1}" step="1">
							<div id="<c:out value="${stats[i].choix}"></c:out>"
								class="chartItem">
								<p class="desProd">
									<c:out value="${stats[i].choix}"></c:out>
								</p>
								<p class="totalAchats">
									<c:out value="${stats[i].nbrVoeux}"></c:out>
								</p>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<div>
					<canvas id="myChart" class="my-chart" width="400" height="100"
						style="width: 300px; height: 100px; margin-top: 2rem"></canvas>
				</div>
			</div>
		</div>
	</div>
	<script src="js/sidebarToggle.js"></script>
	<!-- 	<script -->
	<!-- 		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.1.1/chart.min.js" -->
	<!-- 		integrity="sha512-MC1YbhseV2uYKljGJb7icPOjzF2k6mihfApPyPhEAo3NsLUW0bpgtL4xYWK1B+1OuSrUkfOTfhxrRKCz/Jp3rQ==" -->
	<!-- 		crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
		const chartData = document.querySelector("#chartData");
// 		const chartItems = document.querySelectorAll(".chartItems");
		const desProd = document.querySelectorAll(".desProd");
		const dataLables = [];
		desProd.forEach((el) => (
				dataLables.push(el.innerText)
		))
		console.log(dataLables);
		const data = []
		const totalAchats = document.querySelectorAll(".totalAchats");
		totalAchats.forEach((el) => (
				data.push(parseInt(el.innerText))))
		console.log(data);
		const ctx = document.getElementById('myChart');
		
		new Chart(ctx,
				{
					type : 'bar',
					data: {
					      labels: dataLables,
					      datasets: [{
					        label: '# of Choix',
					        data: data,
					        borderWidth: 1,
							backgroundColor: [
							      'rgba(255, 99, 132, 0.2)',
							      'rgba(255, 159, 64, 0.2)',
							      'rgba(255, 205, 86, 0.2)',
							      'rgba(75, 192, 192, 0.2)',
							      'rgba(54, 162, 235, 0.2)',
							      'rgba(153, 102, 255, 0.2)',
							      'rgba(201, 203, 207, 0.2)'
							],
							borderColor: [
							      'rgb(255, 99, 132)',
							      'rgb(255, 159, 64)',
							      'rgb(255, 205, 86)',
							      'rgb(75, 192, 192)',
							      'rgb(54, 162, 235)',
							      'rgb(153, 102, 255)',
							      'rgb(201, 203, 207)'
							    ],
					      }]
					},
					options : {
						scales : {
							y : {
								beginAtZero : true
							}
						}
					}
				});
	</script>
</body>
</html>