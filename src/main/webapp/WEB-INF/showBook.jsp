<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Book Club</title>
</head>
<body>
	<div class="container my-4">
		<a href="/books" class="btn btn-primary float-end">Dashboard</a>
		<h1>
			<c:out value="${ book.title }"></c:out>
		</h1>
		<h3>
			<c:out value="${ user.equals(book.user) ? 'You' : book.user.name }"></c:out>
			read
			<c:out value="${ book.title }"></c:out>
			by
			<c:out value="${ book.author }"></c:out>
		</h3>
		<h2>
			Here are
			<c:out
				value="${ user.equals(book.user) ? 'your' : book.user.name.concat('\\'s') }"></c:out>
			thoughts:
		</h2>
		<div class="m-5 p-3 border rounded">
			<p>
				<c:out value="${ book.thoughts }"></c:out>
			</p>
		</div>
		<c:if test="${ user.equals(book.user) }">
			<a href="/books/${ book.id }/edit" class="btn btn-secondary float-end">Edit</a>
		</c:if>
	</div>
</body>
</html>