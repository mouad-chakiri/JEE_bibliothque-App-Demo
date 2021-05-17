package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.realm.AuthenticatedUserRealm;
import org.apache.catalina.valves.rewrite.InternalRewriteMap.UpperCase;
import org.apache.jasper.tagplugins.jstl.core.Out;

import DAO.EtudiantManager;
import DAO.authentification;
import metier.auteur;
import metier.etudiant;

@WebServlet({"/connexion","/registration","/recupererAuteur","/recupererCategorie"})

public class connexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
   //methode qui faire la connexion a un compte -----------------------------------------------------------------
	public void connexionUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String userMail = request.getParameter("mail");
		String password = request.getParameter("password");
		String message=null;
		
		authentification user = new authentification(userMail , password);
		if ( user.verifier()) {
			HttpSession session = request.getSession();
			EtudiantManager et = new EtudiantManager();
			session.setAttribute("etudiant", et.etudiantInfo(userMail, password));
			//send to information page 
			try {
				this.getServletContext().getRequestDispatcher("/informationPage.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			message = "mot de pass ou mail inccorect !! ";
			request.setAttribute("message", message);
				try {
					this.getServletContext().getRequestDispatcher("/connexion.jsp").forward(request, response);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		
	}
	
	
	//methode qui cree un compte --------------------------------------------------------------------------------
	public void registration(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String mail = (request.getParameter("mail")).toLowerCase();
		String password = request.getParameter("password");
		String typeUser = request.getParameter("type");
		String message=null;
		
		
		//verifier si Mail est deja exist (un etudiant avec cette mail est daja existe dans la base)
		if ( authentification.verifierMail(mail) || (nom.trim()).isEmpty() || (prenom.trim()).isEmpty() || (mail.trim()).isEmpty() || (password.trim()).isEmpty()) {
			message = "cette mail déjà existe ou un chapm vides si'il vous plais virifeir vous information";
			request.setAttribute("message", message);
			try {
				this.getServletContext().getRequestDispatcher("/registration.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}else if(typeUser.equals("etudiant")) {
			etudiant etu = new etudiant(nom , prenom , password , mail);
			EtudiantManager manager = new EtudiantManager();
			manager.ajouterEtudiant(etu);
			message = "etudiant bien ajouter";
			request.setAttribute("message", message);
			HttpSession session = request.getSession();
			EtudiantManager et = new EtudiantManager();
			session.setAttribute("etudiant", et.etudiantInfo(mail, password));
			//redection vers la page jsp qui contient les information
			try {
				this.getServletContext().getRequestDispatcher("/informationPage.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			// ajouter un nv auteur 
		}
		
		
		
	}
	
	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getRequestURI().equals("/chakiri_Mouad/connexion")) {
			connexionUser(request , response);
		}else {
			registration(request,response);
		}
}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getRequestURI().equals("/chakiri_Mouad/recupererAuteur")) {
			this.getServletContext().getRequestDispatcher("/affichagePage.jsp?var=afficherLivreParAuteur").forward(req, resp);
		}else if (req.getRequestURI().equals("/chakiri_Mouad/recupererCategorie")) {
			this.getServletContext().getRequestDispatcher("/affichagePage.jsp?var=afficherLivreParCategorie").forward(req, resp);
		}else {
			this.getServletContext().getRequestDispatcher("/chakiri_Mouad/connexion").forward(req, resp);
		}
	}
	
	
}
