package metier;

public class auteur {
	private String nom;
	private String prenom ;
	private int id;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public auteur(auteur a) {
		nom = a.nom;
		prenom = a.prenom;
		id = a.id;
	}
	
	public auteur() {
		
	}
	
	public auteur(String name , String lastName , int id) {
		nom = name;
		prenom = lastName;
		this.id = id;
		
	}
	
	public auteur(String name , String lastName) {
		nom = name;
		prenom = lastName;
		
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	
	
	
	

}
