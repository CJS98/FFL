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
<title>post</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%-- end of header --%>
<div class="container">
	<jsp:include page="parts/forum-header.jsp"></jsp:include>

	<div class="col-sm-9">
		<div class="post post-orginal clearfix">
			<div class="text-center col-sm-2">
			<img alt="" src="../img/sample.jpg" class="img-circle profile-image-small">
			<p>user name</p>
			</div>
			<jsp:include page="parts/forum-post.jsp"></jsp:include>
		</div>
		<!-- end of original post -->
		<hr>
		<div class="post post-comment-group clearfix">
			<div class="post-comment">
			<div class="col-sm-2"></div>
			<jsp:include page="parts/forum-post.jsp"></jsp:include>
			<div class="text-center col-sm-2">
				<img alt="" src="../img/sample.jpg" class="img-circle profile-image-small">
				<p>user name</p>
			</div>
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
