<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%@ page
	import="java.util.ArrayList,bean.*,database.*,java.text.DecimalFormat"%>
<%!ActivityDB actdb = new ActivityDB();%>
<%!Activity actf; %>
<%!ArrayList<Activity> actfl; %>
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
	<jsp:include page="parts/page-header.jsp"></jsp:include>
	<%
				DecimalFormat df = new DecimalFormat("##.00");
			%>
			<%if(request.getParameter("actId")== null){%>
			<script language = "javascript">
			window.location.href = "pageerror.jsp"
			</script>
			
			<% }else{
				 actfl = actdb.getActivityById(request.getParameter("actId"));
			
			 actf = actfl.get(0);
			
			%>
				<div class = "col-md-5"></div><%=actf.getActivityId() %><div class = "col-md-7"></div>
	


<%} %>
</div>

<%-- end of main container --%>
<jsp:include page="footer.jsp"></jsp:include>
<%-- end of footer --%>

</body>
</html>
