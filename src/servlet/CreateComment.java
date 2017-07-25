package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import bean.Comment;
import common.UID;
import database.CommentDB;
import database.DBAO;

/**
 * Servlet implementation class createComment
 */
@WebServlet("/CreateComment")
public class CreateComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession(true);
		Account ac = (Account)s.getAttribute("account");
		try {
			String postId = request.getParameter("postId");
			if(request.getParameter("action").equals("create")){
				CommentDB combd = new CommentDB();
				Comment com = new Comment();
				com.setCommentContent(request.getParameter("commentContent"));
				com.setDate(DBAO.getDateTime());
				com.setCommentGroup("Parent");
				com.setAccountId(ac.getAccountId());
				com.setPostId(postId);
				if(request.getParameter("commentId") != null){
					System.out.println("Log: comments comment not null");
					com.setCommentsComId(request.getParameter("commentId"));
				}
				if(request.getParameter("hideId") != null){
					com.setHideId(request.getParameter("hideId").charAt(0));
				}
				String result = combd.createComment(com);
				String path = "";
				System.out.println("log CreateComment Servlet: " + result);
				if(!result.equals("fail")){
					path = "Post?postId=" + postId;
				}else{
					path = "Post?message=fail&postId=" + postId;
				}
				response.sendRedirect(path);
			}else if(request.getParameter("action").equals("open")){
				response.setContentType("html/text");
				PrintWriter out = response.getWriter();
				String action = "";
				if(request.getParameter("commentId") == null){
					System.out.println("Log: comments comment null");
					action = "create&postId="+ postId; 
				}else{
					System.out.println("Log: comments comment not null");
					action = "create&postId="+ postId + "&commentId=" + request.getParameter("commentId");
				}
				String id =  UID.genId();
				out.println("<div class='post-comment  clearfix' id='comment-box-"+ id +"'>"
						+ "<div class='col-sm-2'></div>"
						+ "<div class='col-sm-8'><div class='panel panel-default'><div class='panel-body comment-box'>"
						+ "<form action='"+ request.getContextPath() +"/CreateComment?action="+action+"' method='post'>"
						+ "<div class='post-text-content'>"
						+ "<div class='form-group'>"
				  		+ "<label for='commentContent'>Your reply:</label>"
				  		+ "<textarea class='form-control' name='commentContent' id='commenttContent' rows='5' required></textarea>"
				  		+ "</div>"
				  		+ "<div class='checkbox'><label><input type='checkbox' name='hideId' value='Y'>Anonymous</label></div>"	
						+ "</div><br>"
						+ "<button type='submit' class='btn btn-success col-md-6'>Post</button>"
						+ "<button type='button' class='btn btn-danger col-md-6' onclick='closeCommentBox("+ id +")' >Cancel</button>"
						+ "</form>"
						+ "</div></div></div>"
						+ "<div class='text-center col-sm-2'>"
						+ "<img alt='' src='../img/sample.jpg' class='img-circle profile-image-small'>"
						+ "<p>"+ ac.getGivenName() +"</p>" //TODO replace with user name
						+ "</div><br><br></div>");

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
