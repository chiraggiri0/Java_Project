<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Registration</title>
<%@ include file="all_compnet/allCss.jsp" %>

</head>
<body style="background-color: #f0f1f2;">
<%@ include file="all_compnet/navbar.jsp" %>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
		<h4 class="text-center ">Registration Page</h4>	
		
		<c:if test="${not empty succMSg}">
    <p class="text-center text-success">${succMSg}</p>
   <c:remove var="succMSg" scope="session"/>
</c:if>

<c:if test="${not empty failedmsg}">
    <p class="text-center text-danger">${failedmsg}</p>
  <c:remove var="failedmsg" scope="session"/>
</c:if>

				
					<form action="registration" method="post">
<div class="form-group">
    <label for="exampleInputFirstname">Full Name</label>
    <input type="text" class="form-control" id="exampleInputfirstname" aria-describedby="emailHelp" placeholder="Enter fullname" required="required" name="name">
</div>

<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required" name="email">
</div>

<div class="form-group">
    <label for="exampleInputnumber">phone no</label>
    <input type="number" class="form-control" id="exampleInputnumber" aria-describedby="numberhelp" placeholder="Enter number" required="required" name="phone">
</div>

<div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="required" name="password">
</div>

<div class="form-check">
    <input type="checkbox" class="form-check-input" name="check" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree terms & condition</label>
</div>

<button type="submit" class="btn btn-primary">Submit</button>
</form>
					
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="all_compnet/footer.jsp" %>
</body>
</html>