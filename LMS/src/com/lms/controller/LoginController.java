package com.lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.dao.LibrarianDAO;
import com.lms.daoimplement.LibrarianDaoImplement;
import com.lms.model.Librarian;
import com.lms.model.Login_Details;
import com.lms.security.SecurePassword;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		LibrarianDAO lab_dao = new LibrarianDaoImplement();
		if(lab_dao.checkLibrarianByUsername(username) == null){
			System.out.println("Not Registered Register First");
			request.getRequestDispatcher("registerationpage.jsp").forward(request, response);
		}else{
			Login_Details log = lab_dao.getLoginDetails(username);
			if(SecurePassword.verifyUserPassword(password, log.getPassword(), log.getSalt())){
				HttpSession session = request.getSession();
				Librarian librarian = lab_dao.getLibrarianByUsername(username);
				session.setAttribute("loginUser", librarian);
				System.out.println("Your Login Now");
				request.getRequestDispatcher("profilepage.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
	}

}
