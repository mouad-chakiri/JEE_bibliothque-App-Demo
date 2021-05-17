package metier;

import java.util.ArrayList;

import DAO.EtudiantManager;

public class etudiant {
	private String name;
	private String prenome;
	private String password;
	private int id;
	private String mail ;
	
	public etudiant() {
		
	}
	public etudiant(String name, String prenome,String password,String mail) {
		this.name = name;
		this.password = password;
		this.prenome = prenome;
		this.mail = mail ;
	}
	
	public String getName() {
		return name;
	}
	
	public String getPrenome() {
		return prenome;
	}
	
	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public void setPrenome(String prenome) {
		this.prenome = prenome;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	

}
