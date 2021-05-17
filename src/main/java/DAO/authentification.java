package DAO;
import java.sql.*;

import metier.etudiant;
public class authentification {
	private String email;
	private String pass;
	

	public authentification(String email , String pass){
		this.email = email;
		this.pass = pass;
	}
	
	public boolean verifier(){
		boolean verifier = false ;
		String sql = "SELECT password , LOWER(mail) FROM etudiant;";
		db.connect();
		ResultSet result = db.select(sql);
		
		try {
			while (result.next()) {
				if (pass.equals(result.getString(1)) && (email.toLowerCase()).equals(result.getString(2)) && !verifier) {
					verifier = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		db.deconnecter();
		return verifier;
	}
	
	//verifier si email est deja existe dans la base de donnee
	public static boolean verifierMail(String m){
		boolean verifier = false ;
		String sql = "SELECT LOWER(mail) FROM etudiant;";
		db.connect();
		ResultSet result = db.select(sql);
		try {
			while (result.next()) {
				if ((m.toLowerCase()).equals(result.getString(1)) && !verifier) {
					verifier = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		db.deconnecter();
		return verifier;
	}
	
	
	/*---------------------------------------------------------------------------*/


	
	
/*---------------------------------------------------------------------------*/
	public static int maxID(String table) {
		int id=0;
		db.connect();
		ResultSet r =db.select("select max(id) from "+table);
		try {
			while(r.next()) {
				id = r.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
		
	}
	
	
}
