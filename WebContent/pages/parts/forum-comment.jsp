<div class="col-sm-8">
	<div class="panel panel-default">
		<small class="pull-right post-date">${comment.date}</small>
		<div class="panel-body ">
			<div class="post-text-content">
				<p>${comment.commentContent}</p>
			</div>
			<hr>
			<div class="post-button-group btn-toolbar clearfix" role="toolbar" aria-label="...">
				<div class="btn-group" role="group" aria-label="...">
					<jsp:include page="likeButtons.jsp">
						<jsp:param value="${comment.commentId }" name="Id"/>
						<jsp:param value="commentId" name="colName"/>
						<jsp:param value="${comment.likeCount }" name="likeCount"/>
						<jsp:param value="${comment.dislikeCount }" name="dislikeCount"/>
					</jsp:include>
					<button type="button" class="btn btn-default btn-sm btn-no-border">
						<span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
						Follow
					</button>
				</div>
				<div class="btn-group pull-right dropdown">
					<button id="post-controls-dropdown" type="button"
						class="btn btn-default btn-sm btn-no-border dropdown-toggle pull-right"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="glyphicon glyphicon-option-horizontal"
							aria-hidden="true"></span>&nbsp <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="post-controls-dropdown">
						<li><a href="#">Report post</a></li>
						<li><a href="#">Report user</a></li>
					</ul>
					<button type="button" class="btn btn-default btn-sm btn-no-border">
						<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
						<span class="meta-value-count" data-count="${comment.commentCount}">${comment.commentCount}</span>
					</button>
				</div>
				<br>
				<br>
				<% if(true){ // TODO check if post is close
							// TODO jvascript method to create Comments
					%> 
					<button type="button" id="createComment-${comment.commentCount }" class="btn btn-success btn-block addCom" onclick="createCom('${comment.commentId }','after','comment')">Reply</button> 
					<%
				} %>
			</div>
			${comment.commentCount eq 0 ? '' : '<hr>'}
			<div class="comments-comment">
				<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
				<%@ taglib prefix="f" uri="../../WEB-INF/ffl.tld"%>
				<c:forEach items="${f:getCommentByCommentId(comment.commentsComId,0,5) }" var="commentCom">
					<div class="row comment-under-comment">
								<div class="col-sm-2">
									<img src = '../img/sample.jpg' class="img-circle profile-image-xsmall">
									<p>says: </p>
								</div>
								<div class="col-sm-10">
									<p>${commentCom.givenName }</p>
								</div>
							</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>