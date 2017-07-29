<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "../../WEB-INF/ffl.tld" %>
<div class="col-sm-8">
	<div class="panel panel-default">
		<small class="pull-right post-date">${post.date}</small>
		<div class="panel-body ">
			<div class="post-text-content">
				<h4>${post.postTitle}</h4>
				<div class="clearfix post-catTag-group">
					<div class="col-sm-3">
						<span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>			
						<span class="tab-title">${post.postCategory }</span>
					</div>
					<c:if test="${post.tagList != '' ? true:false }">
						<div class="col-sm-3">	
						<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>	
						<span class="tab-title">${post.tagList }</span>	
						</div>
					</c:if>
				</div>
				<hr>
				<p>${post.postContent}</p>
			</div>
			<hr>
			<div class="post-button-group btn-toolbar clearfix" role="toolbar" aria-label="...">
				<div class="btn-group" role="group" aria-label="...">
					<jsp:include page="likeButtons.jsp">
						<jsp:param value="${post.likeAccounts }" name="likeAccounts"/>
						<jsp:param value="${post.dislikeAccounts }" name="dislikeAccounts"/>
						<jsp:param value="${post.postId }" name="Id"/>
						<jsp:param value="${post.likeCount }" name="likeCount"/>
						<jsp:param value="${post.dislikeCount }" name="dislikeCount"/>
					</jsp:include>
					<c:choose>
						<c:when test="${followed}">
							<button type="button" class="btn btn-danger btn-sm btn-no-border post-followed" id='unfollow-post' data-id="${post.postId }">
								<span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
								Followed
							</button>
							<button type="button" class="btn btn-default btn-sm btn-no-border hide" id='follow-post' data-id="${post.postId }"> 
								<span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
								Follow Post
							</button>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${user ne null }">
									<c:if test="${user.accountId ne post.accountId }">
										<button type="button" class="btn btn-danger btn-sm btn-no-border post-followed hide" id='unfollow-post' data-id="${post.postId }">
											<span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
											Followed
										</button>
										<button type="button" class="btn btn-default btn-sm btn-no-border" id='follow-post' data-id="${post.postId }"> 
											<span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
											Follow Post
										</button>
									</c:if>
								</c:when>
								<c:otherwise>
										<button type="button" class="btn btn-default btn-sm btn-no-border" disabled> 
											<span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
											Login to follow post
										</button>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="btn-group pull-right dropdown">
					<jsp:include page="reportList.jsp">
						<jsp:param value="${post.postId }" name="itemId"/>
						<jsp:param value="${post.accountId }" name="accountId"/>
						<jsp:param value="post" name="type"/>
					</jsp:include>
					<button type="button" class="btn btn-default btn-sm btn-no-border">
						<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
						<span class="meta-value-count" data-count="${post.commentCount}">${post.commentCount}</span>
					</button>
				</div>
				<br>
				<br>
			</div>
			<div class="post-button-action-group">
				<c:choose>
					<c:when test="${post.postStatus != 'closed' ? true : false }">
						<c:choose>
							<c:when test="${user eq null ? 'false' : 'true' }">
								<c:choose>
									<c:when
										test="${user.accountId eq post.accountId ? false : true}">
										<button type="button" id="main-createComment"
											class="btn btn-success btn-block addCom"
											onclick="createCom('post-comment-container','before','post')">Give
											my answer</button>
									</c:when>
									<c:otherwise>
										<p>
											<button type="button" class="btn btn-success col-sm-6"
												onclick="location.href='${pageContext.request.contextPath}/ForumEdit?type=post&mode=edit&postId=${post.postId}'">Edit</button>
											<button type="button" class="btn btn-danger col-sm-6"
												id="post-delete" data-postId="${post.postId }">Delete</button>
										</p>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-success btn-block"
									onclick="location.href='${pageContext.request.contextPath}/Login?redirect=Post?postId=${post.postId }'">Please
									Login to Reply</button>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-success btn-block" disabled>Post
							Closed</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
