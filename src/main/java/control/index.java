package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO;

@WebServlet("/index")
public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;

	public index() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		if (session.getAttribute("connected") == null) {
			response.sendRedirect("/Tp3/Login");
			return;
		} else {
			DAO utilities = new DAO();
			try {
				request.setAttribute("Etudiants", utilities.getEtudiants());
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
