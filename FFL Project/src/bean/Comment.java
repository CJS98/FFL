package bean;

import java.util.ArrayList;

public class Comment extends MetaValue{
	private String commentId, commentContent, commentGroup,commentStatus, postId, accountId, commentsComId;
	private char hideId;
	private int commentCount;
	private ArrayList<Comment> commentComList;
	
	public Comment() {
		super();
	}

	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentGroup() {
		return commentGroup;
	}

	public void setCommentGroup(String commentGroup) {
		this.commentGroup = commentGroup;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getCommentsComId() {
		return commentsComId;
	}

	public void setCommentsComId(String commentsComId) {
		this.commentsComId = commentsComId;
	}

	public String getCommentStatus() {
		return commentStatus;
	}

	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
	}

	public char getHideId() {
		return hideId;
	}

	public void setHideId(char hideId) {
		this.hideId = hideId;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public ArrayList<Comment> getCommentComList() {
		return commentComList;
	}

	public void setCommentComList(ArrayList<Comment> commentComList) {
		this.commentComList = commentComList;
	}
	
	
}
