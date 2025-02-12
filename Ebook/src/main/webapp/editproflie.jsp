<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook:Edit proflie</title>
<%@ include file="all_compnet/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;" >
<%@ include file="all_compnet/navbar.jsp"%>

	<div class="container">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
                <div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Edit Your Proflie</h4>
						
							
					<c:if test="${not empty failedMSg }">
					<h5 class="text-center text-danger ">${failedMSg }</h5>
					<c:remove var="failedMSg" scope="session" />
					</c:if>
					
					<c:if test="${not empty succMsg }">
					<h5 class="text-center text-success ">${succMsg }</h5>
					<c:remove var="succMsg" scope="session" />
					</c:if>
				

						<form action="updateproflie" method="post" >
						<input type="hidden"  value="${userobj.id }" name="id" >

							<div class="form-group">
								<label for="bookName">name*</label> 
								<input name="name" type="text" class="form-control" id="bookName"
									placeholder="Enter name" value="${userobj.name }" >
							</div>
							
							<div class="form-group">
								<label for="bookName">Email*</label> 
								<input name="email" type="text" class="form-control" id="bookName"
									placeholder="Enter Email" value="${userobj.email }" >
							</div>
							
							<div class="form-group">
								<label for="bookName">phone*</label> 
								<input name="phone" type="text" class="form-control" id="bookName"
									placeholder="Enter phone" value="${userobj.phone }">
							</div>
							
								<div class="form-group">
								<label for="bookName">password</label> 
								<input name="password" type="text" class="form-control" id="bookName"
									placeholder="Enter passwrod" >
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