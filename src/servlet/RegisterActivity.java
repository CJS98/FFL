package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import bean.ActReg;
import database.ActRegDB;

/**
 * Servlet implementation class RegAct
 */
@WebServlet("/RegisterActivity")
public class RegisterActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterActivity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {	HttpSession s = request.getSession(true);
		ActRegDB ardb = new ActRegDB();
		ActReg ar = new ActReg();
		Account ac = (Account)s.getAttribute("account");
		ar.setRegistrationId(request.getParameter("registerId"));
		ar.setRegistrationAmtPaid(Double.valueOf(request.getParameter("total")));
		ar.setParticipantNo(Integer.parseInt(request.getParameter("noOfParticipants")));
		ar.setUserAccountId(ac.getAccountId());
		ar.setCashOrBank(request.getParameter("type"));
		ar.setActivityactivityId(request.getParameter("activityId"));
		ardb.RegisterActivity(ar);
		System.out.println("pls help"+ar);
		response.sendRedirect("ActList");
		}catch(Exception ex) {}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}