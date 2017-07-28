

package servlet.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Activity;
import database.ActRegDB;
import database.ActivityDB;

/**
 * Servlet implementation class RegList
 */
@WebServlet("/RegList")
public class RegList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActivityDB adb = new ActivityDB();
		ActRegDB ardb = new ActRegDB();
		ArrayList<Activity> Registration = ardb.getActivityById(request.getParameter("activityId"));
		ArrayList<Activity> activityRegistration = adb.getActivityById(request.getParameter("activityId"));
		request.setAttribute("activityRegistration", activityRegistration);
		request.getRequestDispatcher("pages/RegAct.jsp").forward(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
