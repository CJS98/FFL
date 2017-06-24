<div class="col-sm-8">
	<div class="panel panel-default">
		<small class="pull-right post-date">${param.postDate}</small>
		<div class="panel-body ">
			<div class="post-text-content">
				<h4>${param.postTitle}</h4>
				<p>${param.postContent}</p>
			</div>
			<hr>
			<div class="post-button-group btn-toolbar clearfix" role="toolbar" aria-label="...">
				<div class="btn-group" role="group" aria-label="...">
					<jsp:include page="likeButtons.jsp">
						<jsp:param value="${param.postId }" name="Id"/>
						<jsp:param value="commentId" name="colName"/>
						<jsp:param value="${param.likeCount }" name="likeCount"/>
						<jsp:param value="${param.dislikeCount }" name="dislikeCount"/>
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
						<span class="meta-value-count" data-count="${param.commentCount}">${param.commentCount}</span>
					</button>
				</div>
				<br>
				<br>
				<% if(true){ // TODO check if post is close
							// TODO jvascript method to create Comments
					%> 
					<button type="button" id="createComment-${param.count }" class="btn btn-success btn-block addCom" onclick="createCom('${param.commentId }','after','comment')">Reply</button> 
					<%
				} %>
			</div>
			<%@ page import="java.util.ArrayList,bean.*,database.*" %>
			<%! CommentDB comdb = new CommentDB(); %>
			${param.commentCount eq 0 ? '' : '<hr>'}
			<div class="comments-comment">
				<% ArrayList<Comment> comComList = comdb.getCommentByCommentId(request.getParameter("commentId"), 0, 5); 
					for(Comment cc : comComList){
						%>
							<div class="row comment-under-comment">
								<div class="col-sm-2">
									<img src = '../img/sample.jpg' class="img-circle profile-image-xsmall">
									<p>says: </p>
								</div>
								<div class="col-sm-10">
									<p><%= cc.getCommentContent() %></p>
								</div>
							</div>
						<% 
					}
				%>
			</div>
		</div>
	</div>
</div>