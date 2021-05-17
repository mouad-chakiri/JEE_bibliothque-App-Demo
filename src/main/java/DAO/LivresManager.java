package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import metier.auteur;
import metier.livre;

public class LivresManager {
	private static int idlivre=0 ;
	
	public LivresManager() {
		String table = "livre";
		idlivre = authentification.maxID(table);
	}
	
	public void ajouterLivre(livre l, auteur a) {
		int livreId = ++idlivre;
		String auteurName = a.getNom();
		String auteurPrenom = a.getPrenom();
		String categorie = l.getCategorie();
		String titre = l.getTitre();
		int auteurID = a.getId();
		String sql = "insert into livre values ("+livreId+" , '"+titre+"' , "+auteurID+" , '"+categorie+"');";
		db.connect();
		int n = db.maj(sql);
		db.deconnecter();
	}
	
	
	
	public ArrayList<livre> livreDispo(){
		ArrayList<livre> livreDispo = new ArrayList<livre>();
		db.connect();
		String sql = "select l.id , l.titre , l.auteurID , l.categorie , a.nom , a.prenom from livre l ,auteur a where l.auteurID = a.id";
		ResultSet result = db.select(sql);
		
		try {
			while(result.next()) {
				auteur a = new auteur (result.getString(6) , result.getString(5));
				String titre = result.getString(2);
				String cat = result.getString(4);
				int auteurID = result.getInt(3);
				int livreID = result.getInt(1);
				livre l = new livre(a , cat , livreID , titre);
				livreDispo.add(l);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.deconnecter();
		return livreDispo;
	}
	
	
	
	public ArrayList<livre> afficherLivreParAuteur(String nom , String prenom){
		ArrayList<livre> livres = new ArrayList<livre>();
		
		String sql = "select a.id , a.nom , a.prenom , l.id , l.titre , l.categorie from auteur a, livre l where a.id = l.auteurID AND( a.nom = '"+nom+"' and a.prenom = '"+prenom+"');";
		String lastName=null ;
		String firstName = null ;
		String titre = null;
		String cat=null;
		int idAuteur=0 ;
		int lid=0;
		db.connect();
		ResultSet result = db.select(sql);
		try {
			while (result.next()) {
				idAuteur = result.getInt(1);
				lastName = result.getString(2);
				firstName = result.getString(3);
				lid = result.getInt(4);
				titre = result.getString(5);
				cat = result.getString(6);
				auteur a = new auteur(firstName , lastName , idAuteur);
				livre l = new livre(a, cat, lid, titre);
				livres.add(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.deconnecter();
		return livres;
	}
	
	public ArrayList<livre> afficherLivreParCategorie(String categorie){
ArrayList<livre> livres = new ArrayList<livre>();
		
		String sql = "select a.id , a.nom , a.prenom , l.id , l.titre , l.categorie from auteur a, livre l where a.id = l.auteurID AND l.categorie = '"+categorie+"';";
		String lastName=null ;
		String firstName = null ;
		String titre = null;
		String cat=null;
		int idAuteur=0 ;
		int idLivre=0;
		db.connect();
		ResultSet result = db.select(sql);
		try {
			while (result.next()) {
				idAuteur = result.getInt(1);
				lastName = result.getString(2);
				firstName = result.getString(3);
				idLivre = result.getInt(4);
				titre = result.getString(5);
				cat = result.getString(6);
				auteur a = new auteur(firstName , lastName , idAuteur);
				livre l = new livre(a, cat, idLivre, titre);
				livres.add(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.deconnecter();
		return livres;
	}
	
	
	
	
	public ArrayList<String> categorieDespo() {
		ArrayList<String> cat = new ArrayList<String>();
		db.connect();
		String sql = "select distinct categorie from livre ;";
		String c=null;
		ResultSet result = db.select(sql);
		
		try {
			while(result.next()) {
				c = result.getString(1);
				cat.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cat;
	}
	
	
	
	
	
	
	
	
	

}
