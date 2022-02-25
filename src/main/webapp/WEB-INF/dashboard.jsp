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
		<div class="btn-group float-end">
			<a href="/books/new" class="btn btn-primary">Add Book</a>
			<a href="/logout" class="btn btn-danger">Logout</a>
		</div>
		<h1>
			Welcome,
			<c:out value="${ user.name }"></c:out>
		</h1>
		<p>Books from everyone's shelves:</p>
		
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Posted By</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${ allBooks }">
					<tr>
						<td><c:out value="${ book.id }"></c:out></td>
						<td><a href="/books/${ book.id }"><c:out value="${ book.title }"></c:out></a></td>
						<td><c:out value="${ book.author }"></c:out></td>
						<td><c:out value="${ book.user.name }"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>