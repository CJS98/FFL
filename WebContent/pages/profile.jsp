<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%@ page import ="bean.*" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='${pageContext.request.contextPath}/css/bootstrap.css' rel='stylesheet'>
<link href='${pageContext.request.contextPath}/css/bootstrap.custom.css' rel='stylesheet'>
<link href='${pageContext.request.contextPath}/css/master.css' rel='stylesheet'>
<link rel='icon' href='favicon.ico' type='image/x-icon' />
<title>Template</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%-- end of header --%>

<div class="container">

<div class="col-md-4">
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">My Profile</h3>
  </div>
  <div class="panel-body">
  	 <% Account ac = ((Account)session.getAttribute("account")); %>
	 <p>First Name:<%=ac.getGivenName() %></p> 
     <p>Last Name:<%=ac.getSurName() %></p> 
     <p>Date of Birth:<%=ac.getDob() %></p> 
     <p>Gender:<%=ac.getGender() %></p> 
     <p>Email:<%=ac.getEmail() %></p> 
     <p>Address:<%=ac.getAddress() %></p>
     <p>Mobile No.:<%=ac.getMobileno() %></p> 
  </div>
 	
</div>
<button type="submit" class="btn btn-default">Update Profile</button>

</div>
<div class="col-md:4 pull-right" >
	<jsp:include page="parts/sidebar-account.jsp">
		<jsp:param value="profile" name="type"/>
		<jsp:param value="<%=ac.getPoints() %>" name="points"/>
		<jsp:param value="<%=ac.getCreditLevel() %>" name="creditLevel"/>
	</jsp:include>
</div>
</div>

<%-- end of main container --%>
<jsp:include page="footer.jsp"></jsp:include>
<%-- end of footer --%>

</body>
</html>
