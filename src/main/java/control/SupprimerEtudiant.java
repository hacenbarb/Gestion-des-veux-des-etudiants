package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;

@WebServlet("/SupprimerEtudiant")
public class SupprimerEtudiant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SupprimerEtudiant() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO utilities = new DAO();
		try {
			utilities.supprimerEtudiant(Integer.parseInt(request.getParameter("numE")));
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
