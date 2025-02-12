<%@page import="com.entity.bookdetils"%>
<%@page import="java.util.List"%>
<%@page import="com.database.DBconnect"%>
<%@page import="com.dao.bookdaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook:Oldbook</title>
<%@ include file="all_compnet/allCss.jsp"%>

</head>
<body>
<%@ include file="all_compnet/navbar.jsp"%>
<div class="container">
			<h3 class="text-center ml-2">Old Books</h3>
			<div class="row">

				<%
				bookdaoimpl dao2 = new bookdaoimpl(DBconnect.getconn());
				List<bookdetils> list2 = dao2.getalloldbook();

				for (bookdetils b : list2) {
				%>
				<div class="col-md-3">
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
				<a href="" class="btn btn-danger btn-sm text-white">View All</a>
			</div>

</body>
</html>