<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/index.css">
</head>
<body>
	<div class="wrapper expanded">
		<div class="delete-modal">
			<p>Voulez-vous vraiment supprimer ce produit?</p>
			<div>
				<button class="annuler-button">Annuler</button>
				<button class="confirmer-button">Confirmer</button>
			</div>
		</div>
		<aside class="hidden">
			<div class="aside_header">
				<h1>Menu</h1>
			</div>
			<div class="aside_links">
				<ul>
					<li><a href="index">Etudiants</a></li>
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
					<h1>Ajouter Etudiant</h1>
				</div>
				<div class="form">
					<label for="">nom Etudaint</label> <input type="text" id="nomE"
						name="nomE" min="0" id=""> <label for="">prenom
						Etudiant</label> <input type="text" name="prenomE" id="prenomE"> <label
						for="">moyenne Etudiant</label> <input type="number"
						name="moyenneE" id="moyenneE">
					<button class="btn" style="margin-bottom: 50px"
						id="ajouterEtudiantBtn">Ajouter Etudiant</button>
				</div>
				<br /> <br />
				<h1>Liste des etudiants</h1>
				<input type="search" placeholder="Rechercher un etudiant"
					onkeyup="search()" id="search-input">
				<table id="myTable">
					<thead>
						<tr>
							<th>id</th>
							<th>nom</th>
							<th>Prenome</th>
							<th>Moyenne</th>
							<th>Voeux 1</th>
							<th>Voeux 2</th>
							<th>Voeux 3</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty Etudiants}">
							<c:forEach var="i" begin="0" end="${Etudiants.size()-1}" step="1">
								<tr data-id="<c:out value="${Etudiants[i].numE}"></c:out>">
									<td><c:out value="${Etudiants[i].numE}"></c:out></td>
									<td><c:out value="${Etudiants[i].nomE}"></c:out></td>
									<td><c:out value="${Etudiants[i].prenomE}"></c:out></td>
									<td><c:out value="${Etudiants[i].moyenneE}"></c:out></td>
									<td><c:out value="${Etudiants[i].voeux1}"></c:out></td>
									<td><c:out value="${Etudiants[i].voeux2}"></c:out></td>
									<td><c:out value="${Etudiants[i].voeux3}"></c:out></td>
									<td>
										<div
											style="display: flex; align-items: center; justify-content: space-around;">
											<button
												data-id="<c:out value="${Etudiants[i].numE}"></c:out>"
												class="detele-button btn btn-danger" style="margin: 0">
												Delete
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
		integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
		crossorigin="anonymous" referrerpolicy="no-referrer">		
	</script>
	<script src="js/sidebarToggle.js"></script>
	<script src="js/modalToggle.js"></script>
	<script src="js/search.js"></script>
	<script src="js/dynamicEtudiant.js"></script>
</body>
</html>