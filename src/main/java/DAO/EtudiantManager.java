package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import metier.auteur;
import metier.etudiant;
import metier.livre;

public class EtudiantManager {
	private static int id ;
	
	public EtudiantManager() {
		String table = "etudiant";
		id = authentification.maxID(table);
	}
	
	public void ajouterEtudiant(etudiant e) {
		int ID = ++id;
		String nom, prenom , password , mail ;
		nom = e.getName();
		prenom = e.getPrenome();
		password = e.getPassword();
		mail = e.getMail();
		String sql = "insert into etudiant values ( "+ID+" , '"+nom+"' , '"+ prenom +"' , '"+password+"' , '"+mail + "')";
		db.connect();
		System.out.println(db.maj(sql));
		db.deconnecter();
	}
	
	
	public ArrayList<livre> livreReserver(int id) {
		//id entrer si l'id d'etudiant qui reserver les livres
		ArrayList<livre> livreReserver = new ArrayList<livre>();
		ResultSet result= null;
		
		//nous avons dans la base de donnee un tableau de deux colonnes 
		String sql = "select a.etudiantId, b.titre , b.categorie, b.id , c.nom , c.prenom from livreReserver a , livre b , auteur c where a.livreID = b.id and b.auteurID = c.id;";
		String titre="";
		String catego="";
		int livreId=0;
		db.connect();
		result = db.select(sql);
		try {
			while(result.next() ){
				if( result.getInt(1) == id) {
				auteur a = new auteur(result.getString(5),result.getString(6));
				catego = result.getString(3);
				titre = result.getString(2);
				livreId = result.getInt(4);
				livre l = new livre(a,catego,livreId, titre);
				livreReserver.add(l);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.deconnecter();
		return livreReserver;
	}
	
	public int reserverLivre(int idLivre , int idEtudinat) {
		String sql = "insert into livreReserver values ("+idEtudinat+" , "+idLivre+");" ;
		db.connect();
		int number = db.maj(sql);
		return number;
	}
	
	
	public int reserverLivre(String idLivre , int idEtudinat) {
		int livreId = (int) Integer.parseInt(idLivre);
		String sql = "insert into livreReserver values ("+idEtudinat+" , "+livreId+");" ;
		db.connect();
		int number = db.maj(sql);
		return number;
	}
	
	
	public int supprimerLivreReserver(int livreId , int etudiantID) {
		//nous avons dans la base de donnee un tableau de deux colonnes 
		String sql = "DELETE FROM livrereserver WHERE etudiantId = "+ etudiantID +" AND livreID = "+livreId+" ;";
		db.connect();
		int n = db.maj(sql);
		
		db.deconnecter();
		return n;
	}
	
	public etudiant etudiantInfo(String mail , String password) {
		String sql = "SELECT id , nom , prenom , password ,LOWER(mail)FROM etudiant;";
		etudiant etu = new etudiant();
		db.connect();
		ResultSet result = db.select(sql);
		try {
			while (result.next()) {
				if ((mail.toLowerCase()).equals(result.getString(5)) && password.equals(result.getString(4)) && etu!=null) {
					etu.setId(result.getInt(1));
					etu.setName(result.getString(2));
					etu.setPrenome(result.getString(3));
					etu.setMail(result.getString(5));
					etu.setPassword(result.getString(4));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.deconnecter();
		return etu;
	}
	
	
}

