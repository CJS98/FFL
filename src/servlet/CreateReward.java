package servlet;

import java.io.IOException;
import bean.Account;
import bean.RewardItem;
import common.UID;
import database.RewardItemDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateReward
 */
@WebServlet("/CreateReward")
public class CreateReward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateReward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {	
			HttpSession s = request.getSession(true);
			RewardItemDB rewdb = new RewardItemDB();
			RewardItem rew = new RewardItem();
			Account ac = (Account)s.getAttribute("account");
			UID uid = new UID();
		
			rew.setRewardId(uid.genRewardId());
			rew.setRewardTitle(request.getParameter("rewTitle"));
			rew.setRewardDescription(request.getParameter("rewDesc"));
		    rew.setPoints(Integer.parseInt(request.getParameter("points")));
			rew.setRewardQuantity(request.getParameter("rewQuantity").charAt(0));
			
			
			
			System.out.println(request.getParameter("imgurl"));
			rew.setImgUrl(request.getParameter("imgurl"));
			
		
			
			
  		 rew.setAccountId(ac.getAccountId());
			
			rew.setRewardId(rewdb.createReward(rew));
			
		
			
			if(!rew.getRewardId().equals("fail") || rew.getRewardId() != null){
				request.getRequestDispatcher("RedemptionList").forward(request, response);
			
			}else{
			
				request.getRequestDispatcher("RedemptionList").forward(request, response);
				System.out.println("Log createActivity.java: fail to create activity");
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
