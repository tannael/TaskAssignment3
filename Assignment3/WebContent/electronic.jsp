<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "java.util.*"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   

<%@page import="com.info.EditUser,com.info.EditProduct, com.info.Data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hello</title>
    <link
	  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	  rel="stylesheet"
	/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
  	
  </head>
  <body>
  
    	 <%
				//HERE WE GETTING THE ATTRIBUTE DECLARED IN VALIDATE.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAGE
				String uid = (String)session.getAttribute("username");
      			String type = (String)session.getAttribute("type");
				if (session.getAttribute("type").equals("admin")|| uid == null)
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
	          <a class="nav-link" aria-current="page" href="user.jsp">Home</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="#">About Us</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="#">Contact</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="#">Detail</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="#">Service</a>
	        </li>
	      
	      </ul>
	    
	    </div>
	    
	     <!-- Right elements -->
	     
	    
    <div class="d-flex align-items-center">
				<!-- WE HAVE GIVEN LOGOUT.JSP FILE INORDER TO LOGOUT THE SESSION -->
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
	<br>
	
	<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/listmenu"
        user="root" password="root"
    />
     
    <sql:query var="listUsers"   dataSource="${myDS}">
        SELECT * FROM electronics;
    </sql:query>
     
    <div class="container">
    <caption><h2 align=center>Welcome to Electronic Section</h2></caption>
    <form method="post" action="invoice.jsp">
        <table class="table table-striped w-50 mx-auto" style="width:100%">            
            <tr>
            	<th>ID</th>
                <th>Name</th>
                <th>Image</th>
                <th>Choose</th>
            </tr>
            <c:forEach var="user" items="${listUsers.rows}">
                <tr>
                    <td><c:out value="${user.id}" /></td>
                    <td><a href="statusproduct.jsp?id=${user.id}&product=${user.product}"><c:out value="${user.name}" /></a></td>
                    <td>
	
    					<img src="getimage.jsp?id=${user.id}&product=${user.product}" width="50px">
                    
                    </td>
                    <td><input type="checkbox" name="checkedfood" value="${user.id}" /></td>
                    <td><input type=text name=product value="${user.product}" hidden></td>
                </tr>
            </c:forEach>
        </table>
        
		<input type=text name=date value="<%= (new java.util.Date()).toLocaleString()%>" hidden>
		
		
		<center><input type="submit" class="btn btn-primary" value="Submit"></center>
        
    </form>
    </div>


    
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