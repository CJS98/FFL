<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%@ page
	import="java.util.ArrayList,bean.*,database.*,java.text.DecimalFormat"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='${pageContext.request.contextPath}/css/bootstrap.css' rel='stylesheet'>
<link href='${pageContext.request.contextPath}/css/bootstrap.custom.css' rel='stylesheet'>
<link href='${pageContext.request.contextPath}/css/master.css' rel='stylesheet'>
<link rel='icon' href='favicon.ico' type='image/x-icon' />
<title>Reward Items</title>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%-- end of header --%>

<div class="container">
<div class="container">
	<jsp:include page="parts/page-header.jsp">
		<jsp:param value="Redemption" name="title"/>
		<jsp:param value="5" name="titleWidth"/>
	</jsp:include>
<br>
<div class = "col-md-9">
<%
				
			%>
			<%
				ArrayList<RewardItem> rewList = (ArrayList<RewardItem>) request.getAttribute("rewardList");
				for (RewardItem rew : rewList) {
			%>
	<div class = "clearfix">
		<div class="col-md-4"><img class = "fullactpic" src = "../img/sample.jpg" /></div>
		<div class="col-md-8"><h4>Redemption Title</h4>
		<p>Reward Title : <%= rew.getRewardTitle() %></p>
		<p>Reward Description :<%= rew.getRewardDescription() %></p>
		<p>Points : <%= rew.getPoints() %></p>
		<p>Reward Availability : <%= rew.getRewardAvailability() %></p>
		<p>Reward Quantity : <%= rew.getRewardQuantity() %></p>
		<p>Valid : <%= rew.getValid() %></p>
		<p><span class="glyphicon glyphicon-thumbs-up"></span> 7	<span class="glyphicon glyphicon-thumbs-down"></span> 27</p> 
		</div>
		
	</div>
	 <br></br>
	<%}  %></div>
	
</div>
</div>

<%-- end of main container --%>
<jsp:include page="footer.jsp"></jsp:include>
<%-- end of footer --%>

</body>
</html>
