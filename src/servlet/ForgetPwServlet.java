package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import common.Mail;
import common.UID;
import database.AccountDB;

/**
 * Servlet implementation class ForgetPwServlet
 */
@WebServlet("/ForgetPwServlet")
public class ForgetPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String email = request.getParameter("email");
		AccountDB acdb = new AccountDB();
		if(acdb.checkEmail(email)){
			String id = UID.genSessionId().toString(); 
			HttpSession session = request.getSession();
			session.setAttribute("UUID", id);
			session.setAttribute(id, email);
			Mail mail = new Mail();
			mail.sendSimpleMail(email, "Reset Password","Click the link below to reset your password. <a href = 'http://localhost:8080/FFL/ResetPw?uuid="+id+"'>Reset your password here.</a>");
			request.getRequestDispatcher("pages/login.jsp").forward(request, response);
		}
		else{
			request.setAttribute("message", "Invalid email.");
			request.getRequestDispatcher("pages/forgetpassword.jsp").forward(request, response);
		}
		

		//MailSSL sender = new MailSSL(to,"Reset Password","Click the link below to reset your password.");
		//sender.run();
		
	}

}
