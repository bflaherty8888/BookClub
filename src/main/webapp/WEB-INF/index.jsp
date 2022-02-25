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
	<div class="container">
		<h1>Book Club</h1>
		<p>A place for friends to share thoughts on books.</p>
		<div class="d-flex">
			<div class="col mx-2">
				<h3>Register</h3>
				<form:form action="/register" method="post" modelAttribute="user"
					class="form-control">

					<p>
						<form:label path="name" class="form-label">Name:</form:label>
						<form:input path="name" class="form-control" />
						<form:errors path="name"
							class="form-text alert alert-danger p-1 border-top-0" />
					</p>

					<p>
						<form:label path="email" class="form-label">Email:</form:label>
						<form:input path="email" class="form-control" />
						<form:errors path="email"
							class="form-text alert alert-danger p-1 border-top-0" />
					</p>

					<p>
						<form:label path="password" class="form-label">Password:</form:label>
						<form:input path="password" class="form-control" type="password" />
						<form:errors path="password"
							class="form-text alert alert-danger p-1 border-top-0" />
					</p>

					<p>
						<form:label path="confirm" class="form-label">Confirm Password:</form:label>
						<form:input path="confirm" class="form-control" type="password" />
						<form:errors path="confirm"
							class="form-text alert alert-danger p-1 border-top-0" />
					</p>

					<input type="submit" class="form-control btn btn-primary mt-3">

				</form:form>
			</div>
			<div class="col mx-2">
				<h3>Log In</h3>
				<form:form action="/login" method="post" modelAttribute="loginUser"
					class="form-control">
					<p>
						<form:label path="email" class="form-label">Email:</form:label>
						<form:input path="email" class="form-control" />
						<form:errors path="email"
							class="form-text alert alert-danger p-1 border-top-0" />
					</p>

					<p>
						<form:label path="password" class="form-label">Password:</form:label>
						<form:input path="password" class="form-control" type="password" />
						<form:errors path="password"
							class="form-text alert alert-danger p-1 border-top-0" />
					</p>

					<input type="submit" class="form-control btn btn-primary mt-3">
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>