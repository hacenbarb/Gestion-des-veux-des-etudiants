<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="container">
		<form method="POST">
			<label>Email</label> <input type="email" name="email" /> <label>Mot de
				passe</label> <input type="password" name="password" />
							<c:if test="${!empty error}">
				<p class="error"><c:out value="${error}"></c:out></p>
			</c:if>
			<button>Login</button>
		</form>
		<c:if test="${!empty connected}">
				<p class="error"><c:out value="${connected}"></c:out></p>
			</c:if>
	</div>
</body>
</html>