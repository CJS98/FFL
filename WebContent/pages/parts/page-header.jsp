<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-header">
	<c:choose>
		<c:when
			test="${(pageContext.request.requestURI eq '/FFL/pages/forum.jsp') || (pageContext.request.requestURI eq '/FFL/pages/post.jsp') ? true : false}">
			<h1 class="col-sm-3 pull-left">
				<a
					href="${pageContext.request.requestURI eq '/FFL/pages/post.jsp' ? '/FFL/pages/post.jsp?postId='.concat(param.postId) : pageContext.request.requestURI}">
					Family Forum <br> <small class="page-header-subtitle">Everything
						about life</small>
				</a>
			</h1>
			<div class="col-sm-5 input-group pull-left">
				<input type="text" class="form-control"
					placeholder="Search forum..."> <span
					class="input-group-btn">
					<button class="btn btn-default" type="button">Go!</button>
				</span>
			</div>
		</c:when>
		<c:when test="${false}">

		</c:when>
		<c:when test="${false}">

		</c:when>
		<c:when test="${false}">

		</c:when>
		<c:otherwise>
			<h1
				class="col-sm-${param.titleWidth eq null ? '3' : param.titleWidth } pull-left">
				<a href="${pageContext.request.requestURI}">${param.title }<br>
					<small class="page-header-subtitle">${param.subTitle }</small>
				</a>
			</h1>

		</c:otherwise>
	</c:choose>

</div>
<!-- end of page header -->