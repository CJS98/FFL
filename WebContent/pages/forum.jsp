<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='../css/bootstrap.css' rel='stylesheet'>
<link href='../css/bootstrap.custom.css' rel='stylesheet'>
<link href='../css/master.css' rel='stylesheet'>
<link rel='icon' href='favicon.ico' type='image/x-icon' />
<title>Template</title>
<%@ page import="java.util.ArrayList,Bean.*" %>
<%	if(request.getParameter("category") == null) {%>
<jsp:forward page="forum.jsp?category=1&page=1"></jsp:forward>
<%} %>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%-- end of header --%>
<div class="container">
	<div class="page-header">
	  	<h1 class="pull-left">Family Forum <br><small class="page-header-subtitle">Everything about life</small></h1>
		<div class="col-sm-5 input-group pull-left">
	     	<input type="text" class="form-control" placeholder="Search forum...">
	      	<span class="input-group-btn">
	        	<button class="btn btn-default" type="button">Go!</button>
	        </span>
        </div>
	</div>
	<!-- end of page header -->
	<div class="col-lg-9 forum-main">
		<div class="panel panel-default forum-main-trending">
		  <div class="panel-heading">
		    <h3 class="panel-title">Trending Topics</h3>
		  </div>
		  <div class="panel-body">
		    <% 
		    //ArrayList<Post> postList = (ArrayList<Post>) session.getAttribute("forumList");
		    for(int i = 0; i<3; i++){
		    	%>
		    	<div class="col-md-4 ">
					<div class="panel panel-default forum-card forum-trending-card">
					  <div class="panel-body">
					    <img alt="profile image" src="../img/sample.jpg" class="img-circle profile-image-medium">
					    <p>this will be the title area</p>
					    <div class="forum-post-control-grps">
					    	<button type="button" class="btn btn-default btn-sm btn-no-border" onclick="">
							  <span class="glyphicon glyphicon-heart" aria-hidden="true"></span> 10
							</button>
							<button type="button" class="btn btn-default btn-sm btn-no-border" onclick="">
							  <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span> 10
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
		<div class="forum-main-posts">
		  <ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="${param.category eq '1' ? ' active' : ''}"><a href="#a" aria-controls="a" role="tab" data-toggle="tab">Category</a></li>
		    <li role="presentation" class="${param.category eq '2' ? ' active' : ''}"><a href="#b" aria-controls="b" role="tab" data-toggle="tab">Category</a></li>
		    <li role="presentation" class="${param.category eq '3' ? ' active' : ''}"><a href="#c" aria-controls="c" role="tab" data-toggle="tab">Category</a></li>
		    <li role="presentation" class="${param.category eq '4' ? ' active' : ''}"><a href="#d" aria-controls="d" role="tab" data-toggle="tab">Category</a></li>
		  </ul>
		
		  <div class="tab-content">
		    <div role="tabpanel" class="tab-pane panel-body ${param.category eq '1' ? ' active' : ''}" id="a">
		    	<% for(int i = 0; i<5; i++){
		    		%>
		    		<div class="panel panel-default forum-card">
		    		<div class="panel-body">
		    			<div class="col-md-2 text-center">
		    				<img alt="profile image" src="../img/sample.jpg" class="img-circle profile-image-small">
		    				<p>User name</p>
		    			</div>
		    			<div class="col-md-10">
		    				<div>
		    				<h4>post title</h4>
		    				</div>
		    				<div class="forum-post-control-grps stick-bottom">
			    				<div class="btn-toolbar" role="toolbar" aria-label="...">
								  <div class="btn-group" role="group" aria-label="...">
									<button type="button" class="btn btn-default btn-sm btn-no-border" onclick="">
										  <span class="glyphicon glyphicon-heart" aria-hidden="true"></span> 10
										</button>
										<button type="button" class="btn btn-default btn-sm btn-no-border" onclick="">
										  <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span> 10
										</button>
										<button type="button" class="btn btn-default btn-sm btn-no-border">
											<span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 100
										</button>
									</div>
								  <div class="btn-group dropdown"  >
								    <button id="post-controls-dropdown" type="button" class="btn btn-default btn-sm btn-no-border dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								      <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>&nbsp
								      <span class="caret"></span>
								    </button>
								    <ul class="dropdown-menu" aria-labelledby="post-controls-dropdown">
								      <li><a href="#">Report post</a></li>
								      <li><a href="#">Report user</a></li>
								    </ul>
								  </div>
								</div>
					   		</div>
		    			</div>
		    		</div>
		    		</div>
		    		<%
		    	} %>
		    	
		    	<nav aria-label="Page navigation">
				  <ul class="pagination pagination-lg">
				  	<% if(!request.getParameter("page").equals("1")){				    	
				    	%>
					    <li>
					      <a href="?category=1&page=${param.page - 1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				    	<%
				    }
				  	
				    for(int i = 1; i<=5; i++){ // TODO change pagination loop maximum
				    	%>
				    	<li><a href="?category=1&page=<%=i%>"><%=i%></a></li>
				    	<% 
				    }
				     
				    if(!request.getParameter("page").equals("5")){ // TODO hide if maximum page reach 
				    	%>
					    <li>
					      <a href="?category=1&page=${param.page + 1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    	<%
				    } %>
				  </ul>
				</nav>
		    </div>
		    <div role="tabpanel" class="tab-pane panel-body ${param.category eq '2' ? ' active' : ''}" id="b">2...</div>
		    <div role="tabpanel" class="tab-pane panel-body ${param.category eq '3' ? ' active' : ''}" id="c">3...</div>
		    <div role="tabpanel" class="tab-pane panel-body ${param.category eq '4' ? ' active' : ''}" id="d">4...</div>
		  </div>
		</div>
	</div>
	<jsp:include page="parts/forum-sidebar.jsp"></jsp:include>
</div>

<%-- end of main container --%>
<jsp:include page="footer.jsp"></jsp:include>
<%-- end of footer --%>

</body>
</html>
