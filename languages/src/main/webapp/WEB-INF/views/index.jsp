<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
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
		<div class="d-flex justify-content-center">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center pb-4">
					<h3>Save Travels</h3>
					<div>
						<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#saveLanguageModal">Add a Language</button>
					</div>
				</div>
				
				<div class="table-responsive">
					<table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col">Name</th>
					      <th scope="col">Creator</th>
					      <th scope="col">Current Version</th>
					      <th scope="col">Action</th>
					    </tr>
					  </thead>
					  <tbody>
						  <c:forEach var="language" items="${languages}">
							<tr>
						      <td><a href="/languages/${language.id}">${language.name}</a></td>
						      <td>${language.creator}</td>
						      <td>${language.currentVersion}</td>
						      <td>
						      <div class="d-flex justify-content-between align-items-center">
						      	<a href="/languages/${language.id}/edit">Edit</a>
						      	<form action="/languages/${language.id}" method="post">
						      		<input type="hidden" name="_method" value="DELETE">
						      		<button type="submit" class="btn btn-default link">Delete</button>
						      	</form>
						      </div>
						      </td>
						    </tr>
						</c:forEach>
					  </tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="saveLanguageModal" tabindex="-1" aria-labelledby="saveLanguageModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="saveLanguageModalLabel">New Language</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form:form action="/languages" method="POST" id="validate" modelAttribute="language">
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
							<button class="btn btn-primary" type="submit" value="Submit">Save</button>
						</div>
					</div>
				</div>
			</form:form>
	      </div>
	      <!--<div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div> -->
	    </div>
	  </div>
	</div>
	
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- Javascript Local -->
	<script src="/js/validateHelper.js"></script>
	<script src="/js/validateForm.js"></script>
</body>
</html>