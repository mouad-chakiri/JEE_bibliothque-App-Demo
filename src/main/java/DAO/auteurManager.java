package DAO;

import metier.auteur;
import metier.etudiant;

public class auteurManager {
	private static int id = 0;
	
	public auteurManager() {
		String table = "auteur";
		id = authentification.maxID(table);
	}
	
	public void ajouterAuteur(auteur a) {
		
		int ID = ++id;
		String nom, prenom ;
		nom = a.getNom();
		prenom = a.getPrenom();
		
		String sql = "insert into auteur values ( "+ID+" , '"+nom+"' , '"+ prenom +"')";
		db.connect();
		int maj = db.maj(sql);
		if(maj != 0) {
			System.out.println("l'ajoute bien enr");
		}else {
			System.out.println("Error denregistrement");
		}
	}
	
}
