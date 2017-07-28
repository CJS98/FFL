package database;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import bean.ActReg;
import bean.Activity;
public class ActRegDB extends DBAO{
	
	public ActRegDB(){
		super();
	}
	public ArrayList<ActReg> getRegistration(String statement){
		ArrayList<ActReg> regList = new ArrayList<ActReg>();
		try {
			if(statement == null){
				statement = "SELECT * FROM "+ schema +".registration ORDER BY registrationId DESC";
			}
			PreparedStatement ps;
			ps = con.prepareStatement(statement);
			
			System.out.println("log Registration.java :" + ps);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ActReg reg = new ActReg();
				reg.setRegistrationId(rs.getString("registrationId"));
				reg.setActivityRegistrationDate(rs.getString("registrationDate"));
				reg.setRegistrationAmtPaid(rs.getDouble("registrationAmountPaid"));
				reg.setParticipantNo(rs.getInt("participantNo"));
				reg.setUserAccountId(rs.getString("useraccountId"));
				reg.setParticipantNo(rs.getInt("participantNo"));
				reg.setActivityactivityId(rs.getString("ActivityactivityId"));
				reg.setCashOrBank(rs.getString("bankOrCash"));
				System.out.println("record retrieve");
				regList.add(reg);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return regList;
	}
	public ArrayList<ActReg> getActivityById(String activityId){
		String stmt = "SELECT * FROM "+ schema +".registration WHERE ActivityactivityId = '"+ activityId +"'";
		return getRegistration(stmt);
	}
	public String RegisterActivity(ActReg ar) {
		String stmt = "insert into " + schema + ".registration(registrationId,registrationDate,registrationAmountPaid, participantNo, UseraccountId, ActivityactivityId,bankOrCash) values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(stmt);
			ps.setString(1, ar.getRegistrationId());
			ps.setString(2, ar.getActivityRegistrationDate());
			ps.setDouble(3, ar.getRegistrationAmtPaid());
			ps.setInt(4, ar.getParticipantNo());
			ps.setString(5, ar.getUserAccountId());
			ps.setString(6, ar.getActivityactivityId());
			ps.setString(7, ar.getCashOrBank());
			System.out.println(ps);
			int status = ps.executeUpdate();
			
			if(status != 0){
				System.out.println("Log createActivity() :" + ps);
				return ar.getRegistrationId();
			}else{
				return "fail";
			}
		} catch(SQLException ex) {}
		return null;}

	
}
