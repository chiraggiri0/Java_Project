<%@page import="com.entity.bookdetils"%>
<%@page import="com.database.DBconnect"%>
<%@page import="com.dao.bookdaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook:BookViewDetils</title>
<%@ include file="all_compnet/allCss.jsp"%>

</head>
<body style=" background-color: #f0f1f2; ">
<%@ include file="all_compnet/navbar.jsp"%>

<%
int bid=Integer.parseInt(request.getParameter("bid"));
bookdaoimpl dao=new bookdaoimpl(DBconnect.getconn());
bookdetils b=dao.getbookbyid(bid); 
%>

<div class="container p-3">
<div  class="row">

<div class="col-md-6 text-center p-5 border bg-white">
<img src=<%=b.getPhoto() %> style="height: 250px; width: 200px;">
<h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookname() %></span></h4>
<h4>Author Name: <span class="text-success"><%=b.getAuthor()%></span></h4>
<h4>category: <span class="text-success"><%=b.getBookcategory() %></span></h4>
</div>

<div class="col-md-6 text-center p-5 border bg-white"  >
<h2><%=b.getBookname() %></h2>

<% 
if("Old".equals(b.getBookcategory())){%>
<h5 class="text-primary">Contect To Seller</h5>
<h5 class="text-primary"><i class="far fa-envelope"></i> Email: <%=b.getUser_email() %> </h5>
<% }
%>

<div class="row mt-5">
<div class="col-md-4 text-danger text-center  pd-2"><i class="fa-solid fa-indian-rupee-sign fa-3x"></i>
<p>Cash no Delivery</p></div>
<div class="col-md-4 text-danger text-center  pd-2"><i class="fa-solid fa-rotate-left fa-2x"></i>
<p>Easy to Return</p></div>
<div class="col-md-4 text-danger text-center  pd-2"><i class="fa-solid fa-truck fa-2x"></i>
<p>Free Home Delivery</p></div>
</div>

<% 
if("Old".equals(b.getBookcategory())){%>
<div class="text-center p-3 ">
<a href="index.jsp" class="btn btn-primary "><i class="fa-solid fa-cart-shopping"></i>Continue Shoppig</a>
<a href="#" class="btn  btn-danger "><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice() %></a>
</div>

<% }else{%>
<div class="text-center p-3 ">
<a href="#" class="btn btn-primary "><i class="fa-solid fa-cart-shopping"></i> Add to cart</a>
<a href="#" class="btn  btn-danger "><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice() %></a>
</div>

<%}
%>



</div>
</div>
</div>
</body>
</html>