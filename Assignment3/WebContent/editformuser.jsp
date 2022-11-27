<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.info.EditUser, com.info.Data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hello</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  
  	<link
	  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	  rel="stylesheet"
	/>
  
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
  </head>
  <body> 
  
   	<%
		String uid = (String)session.getAttribute("username");
      	String type = (String)session.getAttribute("type");
		if (uid == null || session.getAttribute("type").equals("user"))
		{
			%><!-- NOT A VALID USER, IF THE USER TRIES TO EXECUTE LOGGED IN PAGE DIRECTLY, ACCESS IS RESTRICTED -->
				<jsp:forward page="logout.jsp"/>
			<%	
		}
	%>
  
    <div class="text-center p-3" style="background-color: orange;">
	    
<h1 align=center>SHOFE</h1>
    </div>

    <nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">Navbar</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="admin.jsp">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="product.jsp">Products</a>
	        </li>
	      </ul>
	    </div>
	    
	    <!-- Right elements -->
    <div class="d-flex align-items-center">
		
      	<%	
			out.println(" Welcome! " +uid);
		%>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="logout.jsp">Logout</a>
				</li>
			</ul>
		</div>

 
    </div>
    <!-- Right elements -->
	  </div>
	</nav>
	<br><br><br>
	
	<%  
		String id=request.getParameter("id");
		Data d=EditUser.getRecordById(Integer.parseInt(id));  
	%>
	
	<h2 align="center">Edit Data</h2>
	
	<form action="./edituser" method="post" class="w-25 mx-auto">
		<div class="container">
		
			<input type=hidden name="id" value="<%=d.getId() %>" >
			
			<div class="mb-3">
				<label for="education" class="form-label">Firstname</label>
				<input type="text" class="form-control" id="firstname" name="firstname" value="<%=d.getFirstname() %>">
			</div>
			<div class="mb-3">
				<label for="education" class="form-label">Lastname</label>
				<input type="text" class="form-control" id="lastname" name="lastname" value="<%=d.getLastname() %>">
			</div>
			<div class="mb-3">
				<label for="education" class="form-label">Username</label>
				<input type="text" class="form-control" id="username" name="username" value="<%=d.getUsername() %>">
			</div>
			<div class="mb-3">
				<label for="education" class="form-label">Email</label>
				<input type="text" class="form-control" id="email" name="email" value="<%=d.getEmail() %>">
			</div>
			<div class="mb-3">
				<label for="education" class="form-label">Password</label>
				<input type="password" class="form-control" id="password" name="password" value="<%=d.getPassword() %>">
			</div>
			<div class="mb-3">
				<label for="education" class="form-label">Address</label>
				<input type="text" class="form-control" id="address" name="address" value="<%=d.getAddress() %>">
			</div>
			<div class="mb-3">
				<label for="education" class="form-label">Phone</label>
				<input type="text" class="form-control" id="phone" name="phone" value="<%=d.getPhone() %>">
			</div>			
			<div class="input-group mb-3">
			  <label class="input-group-text" for="inputGroupSelect01">Type</label>
			  <select class="form-select" id="type" name="type">
			    <option selected><%=d.getType() %></option>
			    <option value="admin">Admin</option>
			    <option value="user">User<option>
			  </select>
			</div>
			
			<div class="mb-3">
				<input type="submit" class="btn btn-primary" value="Submit">
				<a href="admin.jsp" class="btn btn-danger">Cancel</a>
			</div>
		</div>
	</form>
	
<footer class="bg-light text-center text-lg-start mt-auto">
	  <!-- Grid container -->
	  <div style="background-color: orange;">
	  <div class="container p-4">
	    <!--Grid row-->
	    <div class="row">
	      <!--Grid column-->
	      <div class="col-lg-6 col-md-12 mb-4 mb-md-0">	
	        <p>
	          <i class="fa-solid fa-envelope"></i> shofe@gmail.com <br>
	          <i class="fa-solid fa-phone"></i> 0808-1110-2201 <br>
	          <i class="fa-solid fa-location-dot"></i> Jakarta-Bekasi-Indonesia
	        </p>
	      </div>
	      <!--Grid column-->
		 <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
		 </div>
	      <!--Grid column-->
	      <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
	        <p>
	          <a href='http://www.facebook.com/' target='_blank' style="text-decoration:none;"><i class="fa-brands fa-facebook-f"></i> Facebook</a> <br>
	          <a href='http://www.twitter.com/' target='_blank' style="text-decoration:none;"><i class="fa-brands fa-twitter"></i> Twitter</a> <br>
	          <a href='http://www.instagram.com/' target='_blank' style="text-decoration:none;"><i class="fa-brands fa-instagram"></i> Instagram</a> <br>
	          
	        </p>
	      </div>
	      <!--Grid column-->
	    </div>
	    <!--Grid row-->
	  </div>
	  <!-- Grid container -->
	</footer>

</body>
</html>