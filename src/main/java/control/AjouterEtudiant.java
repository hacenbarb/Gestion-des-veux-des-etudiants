package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;

@WebServlet("/AjouterEtudiant")
public class AjouterEtudiant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjouterEtudiant() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DAO utilities = new DAO();
		try {
			System.out.println(Float.parseFloat(request.getParameter("moyenneE")));
			
			utilities.ajouterEtudiant(request.getParameter("nomE"), request.getParameter("prenomE"), Float.parseFloat(request.getParameter("moyenneE")));
			System.out.println("nrmlm say mchat");
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("/Tp3/index");
	}

}
