<%@page import="com.database.DBconnect"%>
<%@page import="com.dao.bookdaoimpl" %>
<%@page import="com.entity.bookdetils" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:all book</title>
<%@ include file="/admin/allCss.jsp"%>

</head>
<body>
	<%@ include file="/admin/navbar.jsp"%>
		<c:if test="${empty userobj }">
	<c:redirect	url="../login.jsp" />
	</c:if>
<h3 class="text-center ">Hello Admin</h3>
	<c:if test="${not empty succMsg}">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty faildMsg }">
		<h5 class="text-center text-danger ">${faildMsg }</h5>
		<c:remove var="faildMsg" scope="session" />
	</c:if>

	<table class="table table-striped ">
  <thead class="bg-primary text-white">
    <tr>
    <th scope="col">ID</th>
      <th scope="col">image</th>
      <th scope="col">Author Name</th>
      <th scope="col">Book name</th>
      <th scope="col">Price</th>
      <th scope="col">categories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
<%
    bookdaoimpl dao = new bookdaoimpl(DBconnect.getconn());
    List<bookdetils> list =dao.getallbook(); // Ensure this method exists in your DAO
    for (bookdetils book : list) {
    	%><tr>
      <td><%=book.getBookid() %></td>
      <td><img src="../book/ <%=book.getPhoto() %>" style="width: 50px; height:50px;"></td>
      <td><%=book.getAuthor() %></td>
      <td><%=book.getBookname() %></td>
      <td><%=book.getPrice() %></td>
      <td><%=book.getBookcategory() %></td>
      <td><%=book.getStatus() %></td>
      <td><a href="editBook.jsp?id=<%=book.getBookid() %>" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i> Edit</a>
      <a href="../delete?id=<%=book.getBookid() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
    </td>
    </tr> 
    	<% 
    }%>
</tbody>
</table>

</body>
</html>