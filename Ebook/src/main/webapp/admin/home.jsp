<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Ebook</title>
<%@ include file="/admin/allCss.jsp"%>
<style type="text/css">
a{
text-decoration: none;
color: black;
}

a:hover {
text-decoration: none;
color: black;
	
}
</style>
</head>
<body>
	<%@ include file="/admin/navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect	url="../login.jsp" />
	</c:if>
	
	
	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="addbook.jsp">
                    <div class="card ">
						<div class="card-body  text-center text-primary">
							<i class="fas fa-plus-square fa-3x"></i><br>
							<h4>Add book</h4>
							------------
      					</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="allbook.jsp">
				<div class="card ">
					<div class="card-body  text-center text-danger">
						<i class="fas fa-book-open fa-3x"></i><br>
						<h4>All book</h4>
						------------

					</div>
				</div> </a>
			</div>

			<div class="col-md-3">
				<a href="order.jsp">
					<div class="card ">
						<div class="card-body  text-center text-warning">
							<i class="fas fa-box-open fa-3x"></i><br>
							<h4>order</h4>
							------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="logout.jsp">
					
					<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card ">
						<div class="card-body  text-center text-primary">
							<i class="fas fa-sign-out-alt fa-3x"></i><br>
							<h4>Logout</h4>
							------------
						</div>
					</div>
					</a>
					
				</a>
			</div>
			
			<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="text-center">
       <h4>Do You Want to Logout?</h4>
      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
<a href="../logout" class="btn btn-primary text-white">Logout</a>
      </div>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
			
		</div>
	</div>
</body>
</html>