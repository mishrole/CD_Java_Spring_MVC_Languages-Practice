<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Languages</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	
	<div class="container py-5">
		<div class="pt-2 pb-4"><a href="/languages">Go back</a></div>
		
		<h3 class="text-center">Language Details</h3>
		
		<div class="d-flex justify-content-between align-items-center pt-2 pb-4">
			<a href="/languages/${language.id}/edit" class="btn btn-info text-white">Edit</a>
			<form action="/languages/${language.id}" method="post">
	      		<input type="hidden" name="_method" value="DELETE">
	      		<button type="submit" class="btn btn-danger">Delete</button>
	      	</form>
		</div>
		
		<div class="d-flex justify-content-center">
			<div class="container">
				<div class="card">
					<div class="card-header">
						<h3><c:out value="${language.name}"></c:out></h3>
					</div>
					<div class="card-body">
						<p><span class="fw-bold">Creator:</span> <c:out value="${language.creator}"></c:out></p>
						<p><span class="fw-bold">Current Version:</span> <c:out value="${language.currentVersion}"></c:out></p>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>