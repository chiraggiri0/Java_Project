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
<title>Ebook:Search Books</title>
<%@ include file="all_compnet/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
    background-color: #fcf7f7;
}
</style>
</head>
<body>
<%@ include file="all_compnet/navbar.jsp"%>
<% 
user u=(user)session.getAttribute("userobj");
%>
	<div class="container">
		<h3 class="text-center">Your Search Book</h3>
		<div class="row p-3">
			<%
			String ch=request.getParameter("ch");
			
			bookdaoimpl dao1 = new bookdaoimpl(DBconnect.getconn());
			List<bookdetils> list1 = dao1.getbookbyserch(ch);

			for (bookdetils b : list1) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
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

</body>
</html>
