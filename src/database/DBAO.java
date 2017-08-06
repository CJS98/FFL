package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class DBAO extends Thread{
	protected static Connection con;
	public static int connectionCount = 0;
	final protected static String schema = "ffl";

	final private String lurl = "jdbc:mysql://25.8.184.20/ffl";


	
	/**
	 * Default constructor
	 * init connection to database
	 */
	public DBAO(){
		try {
			if(con == null || con.isClosed()) {
				openConnection();
			}else {
				System.out.println(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static String getDateTime(){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		java.util.Date myDate = new java.util.Date();
		Timestamp sqlDate = new java.sql.Timestamp(myDate.getTime());
		return formatter.format(sqlDate).substring(0, 19);
	}

	public void openConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(lurl,"root","mysql");

			System.out.println("Open Connection: " + connectionCount);
			connectionCount++;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void closeConnection() {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
