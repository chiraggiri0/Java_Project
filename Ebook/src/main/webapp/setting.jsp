<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook:Setting page</title>
<%@ include file="all_compnet/allCss.jsp"%>
<style type="text/css">
a{
text-decoration: none;
color: black;
}a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f7f7f7;" >
<c:if test="${empty userobj}">
<c:redirect url="login.jsp">
'</c:redirect>

</c:if>

<%@ include file="all_compnet/navbar.jsp"%>
<%
user u=(user)session.getAttribute("userobj");
%>

<div class="container">
<h3 class="text-center text-success mt-2">Hello, <%=u.getName() %></h3>
<div class="row p-5">
			<div class="col-md-6">
				<a href="sellbook.jsp">
					<div class="card text-center ">
						<div class="card-body">
							<i class="fas fa-book-open text-primary fa-3x"></i>
							<h3 >Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6">
				<a href="editproflie.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fa-solid fa-address-card text-primary fa-3x"></i>
							<h3>Edit profile</h3>
						</div>
					</div>
				</a>
			</div>

			

			<div class="col-md-6 mt-3">
				<a href="userorder.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fas fa-box-open text-success fa-3x"></i>
							<h3>My Order</h3>
							<p>track My Order</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fa-solid fa-phone text-danger	 fa-3x"></i>
							<h3>Help Center</h3>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
			

		</div>
</div>

</body>
</html>