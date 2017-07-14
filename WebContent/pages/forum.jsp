<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "../WEB-INF/ffl.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='${pageContext.request.contextPath}/css/bootstrap.css' rel='stylesheet'>
<link href='${pageContext.request.contextPath}/css/bootstrap.custom.css' rel='stylesheet'>
<link href='${pageContext.request.contextPath}/css/master.css' rel='stylesheet'>
<link rel='icon' href='favicon.ico' type='image/x-icon' />
<title>Family Forum</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%-- end of header --%>
<div class="container">
	<jsp:include page="parts/page-header.jsp">
		<jsp:param value="forum" name="type"/>
	</jsp:include>
	
	<div class="col-sm-9 Forum-main">
		<div class="panel panel-default forum-main-trending">
		  <div class="panel-heading">
		    <h3 class="panel-title">Trending Topics</h3>
		  </div>
		  <div class="panel-body">
		    <% 
		    for(int i = 0; i<3; i++){
		    	%>
		    	<div class="col-sm-4 ">
					<div class="panel panel-default Forum-card forum-trending-card">
					  <div class="panel-body text-center">
					    <img alt="profile image" src="../img/sample.jpg" class="img-circle profile-image-medium">
					    <p>this will be the title area</p>
					    <div class="Forum-post-control-grps">
					    	<button type="button" class="btn btn-default btn-sm btn-no-border" onclick="">
							  <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 10
							</button>
							<button type="button" class="btn btn-default btn-sm btn-no-border" onclick="">
							  <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span> 10
							</button>
							<button type="button" class="btn btn-default btn-sm btn-no-border">
								<span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 100
							</button>
					    </div>
					    <button type="button" onclick="location.href='post.jsp?postId=000000'" class="btn btn-primary">Participate</button>
					  </div>
					</div>
				</div>
		    	<%
		    } %>
		  </div>
		</div>
		
		<!-- end of trending post panel -->
		
		<div class="Forum-main-posts">
		  <ul class="nav nav-tabs" role="tablist">
		  	<c:forEach items="general,parenting" var="listItem">
		  	<li role="presentation" class="${category eq listItem ? ' active' : ''}"><a class="tab-title" href="Forum?category=${listItem}&page=1" >${listItem}</a></li>
		  	</c:forEach>
		  </ul>
		
		  <div class="tab-content">
		  	<c:forEach items="general,parenting" var="postCatTab">
		    <div role="tabpanel" class="tab-pane panel-body ${category eq postCatTab ? ' active' : ''}" id="a">
		    	<c:forEach items="${postList}" var="post" begin="0" end="9" varStatus="loop">
		    		<c:set var="post" value="${post}" scope="request"/>
		    		<jsp:include page='parts/forum-postItem.jsp'>
		    			<jsp:param value="${post}" name="post"/>
		    		</jsp:include>
		    	</c:forEach>
		    	<f:PostListPagination pageCount="${f:getMaxCount(page) }" currentPage="${page }" category="${postCatTab }"/>
		    </div>
		    </c:forEach>
		  </div>
		</div>
	</div>
	<jsp:include page="parts/forum-sidebar.jsp">
		<jsp:param value="forum" name="type"/>
	</jsp:include>
</div>

<%-- end of main container --%>
<jsp:include page="footer.jsp"></jsp:include>
<%-- end of footer --%>

</body>
</html>
