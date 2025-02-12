<%@page import="com.entity.book_order"%>
<%@page import="java.util.List"%>
<%@page import="com.database.DBconnect"%>
<%@page import="com.dao.orderBookimpl"%>
<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:order</title>
<%@ include file="/admin/allCss.jsp"%>

</head>
<body>
	<%@ include file="/admin/navbar.jsp"%>
<h3 class="text-center ">Hello Admin</h3>
<table class="table table-striped ">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order ID</th>
      <th scope="col">Name </th>
      <th scope="col">Email</th>
      <th scope="col">Adress</th>
         <th scope="col">Book name</th>
            <th scope="col">Author</th>
               <th scope="col">price</th>
               <th scope="col">payment Types</th>
    </tr>
  </thead>
  
  <tbody>
  <% 
  user u=(user)session.getAttribute("userobj");
  orderBookimpl dao=new orderBookimpl(DBconnect.getconn());
List<book_order> bo=dao.getbook();
 for(book_order b:bo){%> 
 
    <tr>
      <th scope="row"><%=b.getOrderid() %></th>
      <td><%=b.getUsername()%></td>
      <td><%=b.getEmail()%></td>
      <td><%=b.getFulladd()%></td>
      <td><%=b.getBookname()%></td>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getPayment()%></td>
    </tr>
  <%}
  %>
  </tbody>
</table>

</body>
</html>