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
import com.lms.model.Address;
import com.lms.model.Librarian;
import com.lms.model.Login_Details;
import com.lms.security.SecurePassword;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Librarian librarian = new Librarian();
		Address address = new Address();
		LibrarianDAO lab_dao = new LibrarianDaoImplement();
		String event = request.getParameter("event");
		if(event.equals("registration")){
		
			//Librarian Variables
			String lib_name       = request.getParameter("fullname");
			String surname        = request.getParameter("surname");
			String cnic           = request.getParameter("cnic");
			String email          = request.getParameter("email");
			String dateOfJoining  = request.getParameter("dateoj");
			String gender         = request.getParameter("gender");
			String payscale       = request.getParameter("payscale");
			//int salary            = Integer.parseInt(request.getParameter("salary"));
			//Address Variables
			String country        = request.getParameter("country");
			String province       = request.getParameter("province");
			String city 		  = request.getParameter("city");
			String areaStreetHome = request.getParameter("areaStreetHome");
			
			librarian.setLibrarian(lib_name);
			librarian.setSurname(surname);
			librarian.setCnic(cnic);
			librarian.setEmail(email);
			librarian.setDateOfJoining(dateOfJoining);
			librarian.setGender(gender);
			librarian.setPayScale(payscale);
			//librarian.setSalary(salary);
			librarian.setAddress(address);
			
			address.setCountry(country);
			address.setProvince(province);
			address.setCity(city);
			address.setStreet_area_houseNo(areaStreetHome);
			
			System.out.println("Librarian Registration");
			System.out.println(librarian.getLibrarian());
			System.out.println(librarian.getSurname());
			System.out.println(librarian.getCnic());
			System.out.println(librarian.getDateOfJoining());
			System.out.println(librarian.getGender());
			System.out.println(librarian.getPayScale());
			System.out.println(librarian.getSalary());
			System.out.println(librarian.getAddress().getCountry());
			System.out.println(librarian.getAddress().getProvince());
			System.out.println(librarian.getAddress().getCity());
			System.out.println(librarian.getAddress().getStreet_area_houseNo());
			
			
			if(lab_dao.checkLibrarianByCNIC(librarian.getCnic()) == null){
				Librarian sessLab = lab_dao.insertLibrarian(librarian);
				request.getSession().setAttribute("librarian", sessLab);
				request.getRequestDispatcher("signuppage.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("registerationpage.jsp").forward(request, response);
			}
			
		}else if(event.equals("signup")){
			
			
			String password        = request.getParameter("password");
			
			HttpSession session    = request.getSession();
			Librarian lab          = (Librarian)session.getAttribute("librarian");
			
			String salt            = SecurePassword.getSalt(8);
			String securepassword  = SecurePassword.generateSecurePassword(password, salt);
			
			System.out.println("Username :"+lab.getEmail());
			System.out.println("Password :"+password);
			System.out.println("SecurePass :"+securepassword);
			System.out.println("Salt :"+salt);
			System.out.println("Librarian :"+lab.getLibrarian());
			
			Login_Details details = new Login_Details();
			details.setId(lab.getId());
			details.setSalt(salt);
			details.setPassword(securepassword);
			details.setUsername(lab.getEmail());
			
			System.out.println("Details Print Again");
			System.out.println("ID "+details.getId());
			System.out.println("Username "+details.getUsername());
			System.out.println("Password "+details.getPassword());
			System.out.println("Salt "+details.getSalt());
			
			lab_dao.saveLogInfo(details);
			
			request.getRequestDispatcher("registerationpage.jsp").forward(request, response);
		}
		
		
	}

}
