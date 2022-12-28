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

@WebServlet("/ViewStats")
public class ViewStats extends HttpServlet {
	private static final long serialVersionUID = 1L;
    HttpSession session;
    public ViewStats() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		if (session.getAttribute("connected") == null) {
			response.sendRedirect("/Tp3/Login");
		} else {
			DAO utilities = new DAO();
			try {
				request.setAttribute("stats", utilities.getNbrVoeuxParChoix());
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			this.getServletContext().getRequestDispatcher("/WEB-INF/stats.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
