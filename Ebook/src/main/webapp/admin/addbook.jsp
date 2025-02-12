<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:add_book</title>
<%@ include file="/admin/allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;"> 

	<%@ include file="/admin/navbar.jsp"%>
		<c:if test="${empty userobj }">
	<c:redirect	url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
                <div class="card">
					<div class="card-body">
						<h4 class="text-center">Add book</h4>

<c:if test="${not empty succMsg}">
    <p class="text-center text-success">${succMsg}</p>
    <c:remove var="succMsg" scope="session"/>
</c:if>
						<c:if test="${not empty faildMsg }">
					<p class="text-center text-danger ">${faildMsg }</p>
					<c:remove var="faildMsg" scope="session" />
					</c:if>
						<form action="../bookadd1" method="post" enctype="multipart/form-data">

							<div class="form-group">
								<label for="bookName">Book name*</label> 
								<input name="bname" type="text" class="form-control" id="bookName"
									placeholder="Enter Book name">
							</div>
						
							<div class="form-group">
								<label for="authorName">Author name*</label> 
								<input name="author" type="text" class="form-control" id="authorName"
									placeholder="Enter Author Name">
							</div>
							
							<div class="form-group">
								<label for="bookPrice">Price*</label> 
								<input name="price" type="text" class="form-control" id="bookPrice"
									placeholder="Enter price">
							</div>
							
							<div class="form-group">
								<label for="bookCategory">Book categories</label> 
								<select id="bookCategory" name="categories" class="form-control">
									<option selected>--Selected--</option>
									<option value="New">New</option>
									<option value="Old">Old</option>
								</select>
							</div>
							
							<div class="form-group">
								<label for="bookStatus">Book status</label> 
								<select id="bookStatus" name="bstatus" class="form-control">
									<option selected>--Selected--</option>
									<option value="Active">Active</option>
									<option value="InActive">InActive</option>
								</select>
							</div>
							
							<div class="form-group">
								<label for="bookImage">Upload Photo*</label> 
								<input name="bimg" type="file" class="form-control-file" id="bookImage">
							</div>

							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
         	</div>
		</div> <!-- Closing row div -->
	</div> <!-- Closing container div -->

</body>
</html>
