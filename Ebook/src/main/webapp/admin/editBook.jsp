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
<title>Admin:add_book</title>
<%@ include file="/admin/allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;"> 

	<%@ include file="/admin/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
                <div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit book</h4>


					<%
					int id=Integer.parseInt(request.getParameter("id"));
					bookdaoimpl dao = new bookdaoimpl(DBconnect.getconn());
					bookdetils b=dao.getbookbyid(id);
					%>
					
						<form action="../editbooks" method="post" >
						<input type="hidden" name="id" value="<%=b.getBookid()%>">

							<div class="form-group">
								<label for="bookName">Book name*</label> 
								<input name="bname" type="text" class="form-control" id="bookName"
									placeholder="Enter Book name" value="<%=b.getBookname()%>">
							</div>
						
							<div class="form-group">
								<label for="authorName">Author name*</label> 
								<input name="author" type="text" class="form-control" id="authorName"
									placeholder="Enter Author Name" value="<%=b.getAuthor()%>">
							</div>
							
							<div class="form-group">
								<label for="bookPrice">Price*</label> 
								<input name="price" type="text" class="form-control" id="bookPrice"
									placeholder="Enter price" value="<%=b.getPrice() %>">
							</div>
							
							<div class="form-group">
								<label for="bookStatus">Book status</label> 
								<select id="bookStatus" name="bstatus" class="form-control">
								<%if("Active".equals(b.getStatus())){
									%>	<option value="Active">Active</option>
								<% 
								}else{	%>	<option value="InActive">InActive</option>
								<%} %>
								</select>
							</div>
							
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
         	</div>
		</div> <!-- Closing row div -->
	</div> <!-- Closing container div -->

</body>
</html>
