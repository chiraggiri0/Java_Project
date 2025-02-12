<%@page import="java.util.List"%>
<%@page import="com.entity.cart"%>
<%@page import="com.entity.user"%>
<%@page import="com.database.DBconnect"%>
<%@page import="com.dao.cartdaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook:cart</title>
<%@ include file="all_compnet/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@ include file="all_compnet/navbar.jsp" %>

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<c:if test="${ not empty succMsg }">
<div class="alert alert-success" role="alert">${succMsg }</div>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${ not empty failed }">
<div class="alert alert-danger" role="alert">${failed}</div>
<c:remove var="failed" scope="session"/>
</c:if>


<div class="container">
<div class="row">
<div class="col-md-6">

<div class="card bg-white mt-5">
<div class="card-body ">
<h3 class="text-center text-success ">Your selected Item</h3>
<table class="table table-striped ">
  <thead>
    <tr>
      <th scope="col">Bookname</th>
      <th scope="col">Athor</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    
    <%
    user u=(user)session.getAttribute("userobj");
    cartdaoimpl dao=new cartdaoimpl(DBconnect.getconn());
   List<cart> c= dao.getbookbyuser(u.getId());
    double totalprice=0;
   for(cart b:c)
	{ totalprice =b.getTotalprice();
   %>
	<tr>
      <th scope="row"><%=b.getBookname() %></th>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td>
      <a href="removebook?bid=<%=b.getBid() %> &&uid=<%=b.getUid()%> &&cid=<%=b.getCid()%>" class="btn btn-sm btn-danger">Remove</a>
      </td>
    </tr>
     <%}
    %>
    
    <tr>
    <td>Total price</td>
    <td></td>
    <td></td>
    <td><%=totalprice%></td>
    </tr>
    
  </tbody>
</table>
</div>
</div>
</div>


<div class="col-md-6">
<div class="card bg-white mt-5">
<div class="card-body">
<h3 class="text-center text-success">Enter your Details For Order </h3>

<form  action="order" method="post">
<input type="hidden" value="${userobj.id}" name="id">

<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Name</label>
      <input type="text" name="username" class="form-control" id="inputEmail4" value="<%=u.getName()%>">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email</label>
      <input type="email" name="email" class="form-control" id="inputPassword4" value="<%=u.getEmail()%>">
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Moblie No</label>
      <input type="number" name="phone" class="form-control" id="inputEmail4" value="<%=u.getPhone()%>" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Address</label>
      <input type="text" name="address" class="form-control" id="inputPassword4" required="required" >
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Landmark</label>
      <input type="text" name="landmark" class="form-control" id="inputEmail4" required="required">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">City</label>
      <input type="text" name="city" class="form-control" id="inputPassword4" required="required">
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">State</label>
      <input type="text" name="state" class="form-control" id="inputEmail4" required="required">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Zip</label>
      <input type="number" name="pincode" class="form-control" id="inputPassword4" required="required">
    </div>
  </div>
  
  <div class="form-group">
      <label>payment Method</label>
    <select class="form-control" name="payment">
    <option value="Cod"> Cash On Delivery </option>
    </select>
    </div>
  
  
 <div class="text-center">
<button type="submit" class="btn btn-success">Order Now</button>
<a href="index.jsp" class="btn btn-primary">Continue Shopping</a>
</div>

</form>
</div>
</div>
</div>

</div>
</div>

</body>
</html>