package metier;

public class livre {
	private auteur aut;
	private String categorie;
	private int id;
	private String titre;
	
	public livre(auteur aut, String categorie, int id, String titre) {
		this.aut = aut;
		this.categorie = categorie;
		this.id = id;
		this.titre = titre;
	}
	
	public livre() {
		
	}
	
	public livre(auteur a, String categorie, String titre) {
		aut = new auteur(a);
		this.categorie = categorie;
		this.titre = titre;
	}
	
	public livre(String categorie, String titre) {
		this.categorie = categorie;
		this.titre = titre;
	}
	
	public auteur getAuteur() {
		return aut;
	}
	public void setAuteur(auteur aut) {
		this.aut.setNom(aut.getNom());
		this.aut.setPrenom(aut.getPrenom());
	}
	public String getCategorie() {
		return categorie;
	}
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	
	
	public void afficher() {
		System.out.print("L'id de livre : "+ id);
		System.out.print("L'auteur : "+ aut.getNom() + " " + aut.getPrenom());
		System.out.print("catégorie: "+ categorie);
		System.out.print("titre : "+ titre);
	}
	
}
