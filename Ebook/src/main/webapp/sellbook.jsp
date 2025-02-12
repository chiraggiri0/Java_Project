<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Sell Book</title>
<%@ include file="all_compnet/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;" >
<%@ include file="all_compnet/navbar.jsp"%>

	<div class="container">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
                <div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Sell old book</h4>

						<form action="add_oldbook" method="post"  enctype="multipart/form-data" >
						<input type="hidden" value="${userobj.email }"  name="user">

							<div class="form-group">
								<label for="bookName">Book name*</label> 
								<input name="bname" type="text" class="form-control" id="bookName"
									placeholder="Enter Book name" >
							</div>
							
							<div class="form-group">
								<label for="bookName">Author name*</label> 
								<input name="author" type="text" class="form-control" id="bookName"
									placeholder="Enter Author name" >
							</div>
							
							<div class="form-group">
								<label for="bookName">Price*</label> 
								<input name="price" type="text" class="form-control" id="bookName"
									placeholder="Enter price" >
							</div>

							<div class="form-group">
								<label for="bookImage">Upload Photo*</label> <input name="bimg"
									type="file" class="form-control-file" id="bookImage">
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
         	</div>
		</div> <!-- Closing row div -->
	</div> <!-- Closing container div -->


</body>
</html>