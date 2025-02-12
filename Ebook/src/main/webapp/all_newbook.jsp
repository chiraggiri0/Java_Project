<%@page import="com.entity.user"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.bookdetils"%>
<%@page import="com.database.DBconnect"%>
<%@page import="com.dao.bookdaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook:NEwbook</title>
<%@ include file="all_compnet/allCss.jsp"%>


<style type="text/css">
.card-ho:hover{background-color: #fcf7f7}
	#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;}
#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;}
@keyframes fadeIn {from { bottom:0;
	opacity: 0;}
to {
	bottom: 30px;
	opacity: 1;}}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;}
to {
	bottom: 0;
	opacity: 0;
}
}
</style>

</head>
<body>
<c:if test="${not empty addcart }">
<div id="toast">${addcart }</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
<c:remove var="addcart" scope="session"/>
</c:if>

<% 
user u=(user)session.getAttribute("userobj");
%>

<%@ include file="all_compnet/navbar.jsp"%>
		<div class="container">
			<h3 class="text-center ml-2">New Book</h3>
			<div class="row">


				<%
			      bookdaoimpl dao=new bookdaoimpl(DBconnect.getconn()); 
			      List<bookdetils> list=dao.getallnewbook();
			      
			      for(bookdetils b:list)
			      {%>
				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhoto() %>"
								style="width: 150px; height: 200px;" class="img-thumblin">
							<p><%=b.getBookname() %></p>
							<p><%=b.getAuthor() %></p>
							<p>
								Categories:<%=b.getBookcategory()%></p>
							<div class="d-flex justify-content-center">
			
							<%
							if(u==null)
							{%>
							<a href="login.jsp" class="btn btn-danger btn-sm mr-2">Add to Cart</a>
							<% }else{%>
							<a href="cart?bid=<%=b.getBookid() %> &&uid=<%=u.getId() %>" class="btn btn-danger btn-sm mr-2">Add to Cart</a>
							<% }
							%>	

<a href="viewBook.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm mr-2">View Details</a>
 <a	href="" class="btn btn-danger btn-sm"><%=b.getPrice()%></a>
							</div>
						</div>
					</div>
				</div>
				<%}
			      %>


			</div>

			<div class="mt-1 text-center">
				<a href="" class="btn btn-danger btn-sm text-white">View All</a>
			</div>
		</div>

</body>
</html>