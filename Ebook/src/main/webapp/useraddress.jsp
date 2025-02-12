<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook:Address</title>
<%@ include file="all_compnet/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;" >
<%@ include file="all_compnet/navbar.jsp"%>

<div class="container">
		<div class="row p-4">
			<div class="col-md-6 offset-md-2">
                <div class="card text-center">
					<div class="card-body ">
						<h4 class="text-center text-primary">Edit Your Address</h4>

						<form action="">

							<div class="row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-4">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputEmail4">Pincode</label> <input type="number"
										class="form-control" id="inputEmail4">
								</div>
							</div>
							<button type="submit" class="text-center btn btn-primary">Update</button>
						</form>
					</div>
				</div>
         	</div>
		</div> <!-- Closing row div -->
	</div> <!-- Closing container div -->


</body>
</html>