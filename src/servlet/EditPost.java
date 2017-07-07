package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import bean.Post;
import database.DBAO;
import database.ForumDB;

/**
 * Servlet implementation class EditPost
 */
@WebServlet("/EditPost")
public class EditPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession(true);
		Account ac = (Account)s.getAttribute("account");
		ForumDB f = new ForumDB();
		Post p = new Post();
		p.setPostTitle(request.getParameter("postTitle"));
		p.setDate(DBAO.getDateTime());
		p.setPostContent(request.getParameter("postContent"));
		p.setPostCategory(request.getParameter("postCategory"));
		p.setTagList(request.getParameter("postTags"));
		p.setPoints(100);
		p.setAccountId(ac.getAccountId());
		if(request.getParameter("hideId") != null){
			p.setHideId(request.getParameter("hideId").charAt(0));
		}else{
			p.setHideId('N');
		}
		p.setPostId(f.createPost(p));
		
		String path = "";
		if(!p.getPostId().equals("fail") || p.getPostId() == null){
			path = "pages/post.jsp?postId=" + p.getPostId();
		}else{
			path = "pages/forum-eidt?mode=create";
			System.out.println("Log createPost.java: fail to create post");
		}
		response.sendRedirect(path);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}