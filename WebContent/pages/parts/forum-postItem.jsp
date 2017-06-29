<div class="panel panel-default Forum-card">
	<div class="panel-body">
		<div class="col-md-2 text-center">
			<img alt="profile image" src="../img/sample.jpg"
				class="img-circle profile-image-small">
			<p>${post.accountId}</p>
		</div>
		<div class="col-md-10">
			<div class="post-link"
				onclick="location.href='post.jsp?postId=${post.postId}'">
				<h4>${post.postTitle}</h4>
				<small class="">${post.date}</small>
			</div>
			<div class="Forum-post-control-grps">
				<div class="btn-toolbar" role="toolbar" aria-label="...">
					<div class="btn-group" role="group" aria-label="...">
						<jsp:include page="likeButtons.jsp">
							<jsp:param value="${post.postId }" name="Id"/>
							<jsp:param value="postId" name="colName"/>
							<jsp:param value="${post.likeCount}" name="likeCount"/>
							<jsp:param value="${post.dislikeCount}" name="dislikeCount"/>
						</jsp:include>
						<button type="button" class="btn btn-default btn-sm btn-no-border">
							<span class="glyphicon glyphicon-comment " aria-hidden="true"></span>
							<span class="meta-value-count"
								data-count="9">${post.commentCount}</span>
						</button>
					</div>
					<div class="btn-group dropdown">
						<button id="post-controls-dropdown" type="button"
							class="btn btn-default btn-sm btn-no-border dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="glyphicon glyphicon-option-horizontal"
								aria-hidden="true"></span>
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