package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 * 
 * @author cjuns
 *
 */
public class MetaValueDB extends DBAO{
	
	public MetaValueDB(){
		super();
	}
		
//	public boolean checkifMetaExist(String colName, String id, String accountId, String action) {
//		String stmt = "select count(*) from "+ schema +".metavalue where "+ colName +" = ? AND accountId = ? AND action = ?";
//		try {
//			PreparedStatement ps = con.prepareStatement(stmt);
//			ps.setString(1, id);
//			ps.setString(2, accountId);
//			ps.setString(3, action);
//			System.out.println("Log checkifMetaExist(): "+ps);
//			
//			ResultSet rs = ps.executeQuery();
//			while(rs.next()) {
//				if(rs.getInt(1) > 0) {
//					return false;
//				}else {
//					return true;
//				}
//			}
//			rs.close();
//			ps.close();
//		} catch (Exception e) {
//			return false;
//		}
//		return false;
//	}

	/**
	 * create post meta values
	 * @param parentId
	 * @param accountId
	 * @param action like|dislike|follow
	 */
	public String addMeta(String id, String accountId, String action){
		
		String stmt = "INSERT INTO "+ schema +".metavalue (`parentId`, `accountId`, `action`)  VALUES (?, ?, ?)";
		String select = "Select Count(*) from "+ schema +".metavalue where `parentId` = ? And action = ?";
		try {
			PreparedStatement ps = con.prepareStatement(stmt);
			ps.setString(1, id);
			ps.setString(2, accountId);
			ps.setString(3, action);
			PreparedStatement ps1 = con.prepareStatement(select);
			ps1.setString(1, id);
			ps1.setString(2, action);
			System.out.println(ps);
			System.out.println(ps1);
			int status = ps.executeUpdate();
			if(status != 0) {
				ResultSet rs = ps1.executeQuery();
				if(rs.next()) {
					return rs.getString(1);
				}
			}else {
				return "fail";
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return "fail";
	}
	
	public String removeMeta(String id, String accountId, String action) {
		String stmt = "DELETE FROM "+ schema +".metavalue WHERE `parentId`= ? AND accountId = ? AND action = ?";
				String select = "Select Count(*) from "+ schema +".metavalue where `parentId` = ? And action = ?";
		try {
			PreparedStatement ps = con.prepareStatement(stmt);
			ps.setString(1, id);
			ps.setString(2, accountId);
			ps.setString(3, action);
			PreparedStatement ps1 = con.prepareStatement(select);
			ps1.setString(1, id);
			ps1.setString(2, action);
			
			int status = ps.executeUpdate();
			if(status != 0) {
				ResultSet rs = ps1.executeQuery();
				if(rs.next()) {
					return rs.getString(1);
				}
			}else {
				return "fail";
			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	/**
	 * get post meta value accounts
	 * @param parentId
	 * @param action like|dislike|follow
	 * @return
	 */
	public static ArrayList<String> getMetaAccounts(String table, String colName, String id,String action){
		ArrayList<String> list = new ArrayList<String>();
		try {
			String stmt = "select p."+ colName +",m.accountId,m.action from ffl."+ table +" p join metavalue m on p."+ colName +" = m.parentId where p."+ colName +" = ? AND action = ?";
			PreparedStatement ps = con.prepareStatement(stmt);
			ps.setString(1, id);
			ps.setString(2, action);
			System.out.println("log 120"+ps);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				list.add(rs.getString("accountId"));
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

}
