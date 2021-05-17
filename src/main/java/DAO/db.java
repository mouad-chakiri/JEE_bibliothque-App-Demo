package DAO;
import java.sql.*;

public class db {
	
	private static Connection con;
	private static Statement st;
	
	
	
	/* ----------------------etablier la connexion a base de donnee --   ---------*/
	public static void connect() {
		String url = "com.mysql.jdbc.Driver" ; 
		String jdbc = "jdbc:mysql://localhost/biblio";
		String password = "";
		String user = "root";
		try {
			Class.forName(url);
			con = DriverManager.getConnection(jdbc,user,password);
			st = con.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/* -----------------Deconnecter--------------------*/
	public static void deconnecter() {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*-----------------La fonction de select*/
	public static ResultSet select(String sql) {
		ResultSet rs = null;
		try {
			rs = st.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	/*---------------La fonction de mise a jour -----------------*/
	public static int maj(String sql) {
		int numberLine=0;
		try {
			numberLine = st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return numberLine;
	}
	
}
