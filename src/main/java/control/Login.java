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

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		if(session.getAttribute("connected") == null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			return;
		}else {
			response.sendRedirect("/Tp3/index");
			return;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		DAO utilities = new DAO();
		try {
			if(utilities.checkUser(email,password) == true) {
				session.setAttribute("connected", email);
				response.sendRedirect("/Tp3/index");
			}else {
				request.setAttribute("error", "Mot de passe ou Email incorrecte.");
				this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);

			}
		} catch (ClassNotFoundException | SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
