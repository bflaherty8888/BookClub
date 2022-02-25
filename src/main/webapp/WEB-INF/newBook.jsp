<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
		<a href="/dashboard" class="btn btn-primary float-end">Dashboard</a>
		<h1>Add a Book to Your Shelf!</h1>

		<form:form action="/books/create" method="post" modelAttribute="book"
			class="form-control mt-4">

			<p>
				<form:label path="title" class="form-label">Title:</form:label>
				<form:input path="title" class="form-control" />
				<form:errors path="title"
					class="form-text alert alert-danger p-1 border-top-0" />
			</p>

			<p>
				<form:label path="author" class="form-label">Author:</form:label>
				<form:input path="author" class="form-control" />
				<form:errors path="author"
					class="form-text alert alert-danger p-1 border-top-0" />
			</p>

			<p>
				<form:label path="thoughts" class="form-label">Thoughts:</form:label>
				<form:textarea path="thoughts" class="form-control" />
				<form:errors path="thoughts"
					class="form-text alert alert-danger p-1 border-top-0" />
			</p>

			<input type="submit" class="form-control btn btn-primary mt-3">
		</form:form>
	</div>
</body>
</html>