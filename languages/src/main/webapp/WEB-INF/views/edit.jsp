<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- PUT -->
<%@ page isErrorPage="true" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Languages</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	
	<div class="container py-5">
		<div class="d-flex justify-content-center">
			<div class="container">
				<div class="pt-2 pb-4 d-flex justify-content-between align-items-center">
					<a href="/languages">Go back</a>
					<form action="/languages/${language.id}" method="post">
			      		<input type="hidden" name="_method" value="DELETE">
			      		<button type="submit" class="btn btn-danger">Delete</button>
			      	</form>
				</div>
			
				<h3 class="text-center">Edit Language</h3>
				<div class="card">
					<div class="card-body">
						<form:form action="/languages/${language.id}" method="POST" id="validate" modelAttribute="language">
							<input type="hidden" name="_method" value="PUT">
							
							<div class="row mx-auto">
								<div class="col-12">
									<div class="form-floating mb-3">
									  <form:input path="name" type="text" name="name" id="name" class="form-control requires-validation validate-save" />
									  <div class="invalid-feedback"></div>
									  <form:errors path="name" class="text-danger backend-validation" />
									  <form:label for="name" path="name">Language Name</form:label>
									</div>
								</div>
								
								<div class="col-12">
									<div class="form-floating mb-3">
									  <form:input path="creator" type="text" name="creator" id="creator" class="form-control requires-validation validate-save" />
									  <div class="invalid-feedback"></div>
									  <form:errors path="creator" class="text-danger backend-validation" />
									  <form:label path="creator" for="creator">Creator</form:label>
									</div>
								</div>
								
								<div class="col-12">
									<div class="form-floating mb-3">
									  <form:input path="currentVersion" type="text" name="currentVersion" id="currentVersion" class="form-control requires-validation validate-save" />
									  <div class="invalid-feedback"></div>
									  <form:errors path="currentVersion" class="text-danger backend-validation" />
									  <form:label path="currentVersion" for="currentVersion">Current Version</form:label>
									</div>
								</div>
								
								
								<div class="col-12">
									<div class="d-flex align-items-center justify-content-end">
										<button class="btn btn-primary" type="submit" value="Submit">Edit</button>
									</div>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- jQuery (No necesario en Bootstrap 5) -->
	<!-- <script src="/webjars/jquery/jquery.min.js"></script> -->
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- Javascript Local -->
	<script src="/js/validateHelper.js"></script>
	<script src="/js/validateForm.js"></script>
</body>
</html>