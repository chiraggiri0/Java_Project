<%@page import="com.entity.user"%>
<%@page import="com.entity.bookdetils"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.bookdaoimpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook : index</title>
<%@ include file="all_compnet/allCss.jsp"%>
<style type="text/css">

.card {
    border-radius: 10px;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
}
.card img {
    max-width: 100%;
    height: auto;
}

.back-img {
	background: url("img/b.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
.crd.ho:hover{
background-color: #fcf7f7:;  
}

</style>
</head>
<body style="background-color: #f7f7f7;">

<% 
user u=(user)session.getAttribute("userobj");
%>

<%@ include file="all_compnet/navbar.jsp"%>

	<div class="container-fluid back-img">
		<h2 class="text-center text-danger p-3">Ebook Managment system</h2>
	</div>

	<%
	Connection conn = DBconnect.getconn();
	System.out.println(conn);
	%>
	<!-- Start recent book  -->
	<div class="container text-center">
		<h3 class="text-center border mt-2 bg-primary">Recent Book</h3>
		<div class="row p-3">
			<%
			bookdaoimpl dao1 = new bookdaoimpl(DBconnect.getconn());
			List<bookdetils> list1 = dao1.getRecentbook();

			for (bookdetils b : list1) {
			%>

			<div class="col-md-3">
				<div class="card text-center card-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%
							if (b.getBookcategory().equals("Old")) {
							%>
							Categories:<%=b.getBookcategory()%></p>

						<div class="row">
							<a href="viewBook.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"> <%=b.getPrice()%></a>
						</div>

						<%
						} else {
						%>
						Categories:<%=b.getBookcategory()%></p>

						<div class="row">
							<%
							if(u==null)
							{%>
							<a href="login.jsp" class="btn btn-danger btn-sm mr-2">Add to Cart</a>
							<% }else{%>
							<a href="cart?bid=<%=b.getBookid() %> &&uid=<%=u.getId() %>" class="btn btn-danger btn-sm mr-2">Add to Cart</a>
							<% }
							%>
			
							<a href="viewBook.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm ml-2">view Details </a> <a
								href="" class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
</div>

		<div class="mt-1 text-center">
			<a href="all_recentbook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>

		<!-- finish recent book  -->
		<hr>

		<!-- Start neW book  -->
		<div class="container">
			<h3 class="text-center border bg-primary ml-2">New Book</h3>
			<div class="row">
				<%
			      bookdaoimpl dao=new bookdaoimpl(DBconnect.getconn()); 
			      List<bookdetils> list=dao.getnewbook();
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
			
								 <a	href="viewBook.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm mr-2">View Details</a> <a
									href="" class="btn btn-danger btn-sm"><%=b.getPrice()%></a>
							</div>
						</div>
					</div>
				</div>
				<%}
			      %>
			</div>
			<div class="mt-1 text-center">
				<a href="all_newbook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
			</div>
		</div>
		<!-- new book finish -->
		<hr>

		<!-- Start Old book  -->
		<div class="container">
			<h3 class="text-center border bg-danger ml-2">Old Books</h3>
			<div class="row">

				<%
				bookdaoimpl dao2 = new bookdaoimpl(DBconnect.getconn());
				List<bookdetils> list2 = dao2.getoldbook();

				for (bookdetils b : list2) {
				%>
				<div class="col-md-3 ">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhoto() %>"
								style="width: 150px; height: 200px;" class="img-thumblin">
							<p><%=b.getBookname() %></p>
							<p><%=b.getAuthor() %></p>
							<p><%=b.getBookcategory() %></p>
							<div class="d-flex justify-content-center">
						    <a href="viewBook.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm mr-2">View Details</a>
								<a href="" class="btn btn-danger btn-sm"><%=b.getPrice() %></a>
							</div>
						</div>
					</div>
				</div>
				<%}
			      %>
			</div></div>
			<div class="mt-1 text-center">
				<a href="all_oldbook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
			</div>
			<!-- old book finish -->

			<%@ include file="all_compnet/footer.jsp"%>
</body>
</html>