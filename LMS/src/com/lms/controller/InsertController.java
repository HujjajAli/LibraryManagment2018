package com.lms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.AuthorDAO;
import com.lms.dao.BookDAO;
import com.lms.dao.CategoryDAO;
import com.lms.dao.MemberDAO;
import com.lms.dao.PublisherDAO;
import com.lms.daoimplement.AuthorDaoImplement;
import com.lms.daoimplement.BookDaoImplement;
import com.lms.daoimplement.CategoryDaoImplement;
import com.lms.daoimplement.MemberDaoImplement;
import com.lms.daoimplement.PublisherDaoImplement;
import com.lms.model.Address;
import com.lms.model.Author;
import com.lms.model.Book;
import com.lms.model.Category;
import com.lms.model.Member;
import com.lms.model.Publisher;

/**
 * Servlet implementation class InsertController
 */
@WebServlet("/InsertController")
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CategoryDAO cat_dao  = new CategoryDaoImplement();
	AuthorDAO auth_dao   = new AuthorDaoImplement();
    PublisherDAO pub_dao = new PublisherDaoImplement();
    BookDAO book_dao     = new BookDaoImplement();
    MemberDAO mem_dao    = new MemberDaoImplement();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertController() {
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
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		if(action.equals("Save Category")){
			System.out.println("Category Controller");
			String categoryname    = request.getParameter("category");
			String discription = request.getParameter("discription");
			Category category = new Category();
			category.setCategory(categoryname);
			category.setDiscription(discription);
			if(cat_dao.addCategory(category)){
				request.setAttribute("catmsg", "Category Succefully Save in Database");
			}else{
				request.setAttribute("catmsg", "Category Failed to Save");
			}
			request.getRequestDispatcher("addcategory.jsp").forward(request, response);
		}else if(action.equals("Save Author")){
			System.out.println("Category Controller");
			String authorname    = request.getParameter("author");
			String authorcountry = request.getParameter("authorcountry");
			String gender        = request.getParameter("gender");
			String authordob     = request.getParameter("authordob");
			String lifestatus    = request.getParameter("lifestatus");
			
			Author author = new Author();
			author.setAuthor(authorname);
			author.setCountry(authorcountry);
			author.setDob(authordob);
			author.setGender(gender);
			author.setLifestatus(lifestatus);
			
			//String msg = "Author->"+author.getAuthor()+"==Country->"+author.getCountry()+"==DOB->"+author.getDob()+""
			//		+ "==Gender->"+author.getGender()+"==Status->"+author.getLifestatus();
			
			if(auth_dao.addAuthor(author)){
				request.setAttribute("authmsg", "Author Succefully Saved in Database");
			}else{
				request.setAttribute("authmsg", "Author Failed Saved in Database!");
			}
			
			request.getRequestDispatcher("addauthor.jsp").forward(request, response);
		}else if(action.equals("Save Publisher")){
			System.out.println("Publisher Controller");
			
			String publishername = request.getParameter("publisher");
			String country       = request.getParameter("publishercountry");
			String foundingdate  = request.getParameter("foundingdate");
			
			Publisher publisher = new Publisher();
			publisher.setPublisher(publishername);
			publisher.setCountry(country);
			publisher.setFoundingDate(foundingdate);
			
			if(pub_dao.addPublisher(publisher)){
				request.setAttribute("pubmsg", "Publisher Succefully Save in Database");
			}else{
				request.setAttribute("pubmsg", "Publisher Failed to Save");
			}
			request.getRequestDispatcher("addpublisher.jsp").forward(request, response);
		}else if(action.equals("Save Book")){
			System.out.println("Book Controller");
			String bookname = request.getParameter("book");
			String edition  = request.getParameter("edition");
			int pages       = Integer.parseInt(request.getParameter("pages"));
			int category    = Integer.parseInt(request.getParameter("bookcategory"));
			int author      = Integer.parseInt(request.getParameter("bookauthor"));
			int publisher   = Integer.parseInt(request.getParameter("bookpublisher"));
			
			Book book = new Book();
			book.setBook(bookname);
			book.setEdition(edition);
			book.setPages(pages);
			book.setCategory(category);
			book.setAuthor(author);
			book.setPublisher(publisher);
			
			if(book_dao.addBook(book)){
				request.setAttribute("bookmsg", "Book Succefully Save in Database");
			}else{
				request.setAttribute("bookmsg", "Book Failed to Save");
			}
			request.getRequestDispatcher("addbook.jsp").forward(request, response);
		}else if(action.equals("Save Member")){
			System.out.println("Publisher Controller");
			
			String membername = request.getParameter("member");
			String fathername       = request.getParameter("father");
			String cnic  = request.getParameter("cnic");
			String rollNo  = request.getParameter("rollNo");
			String faculty  = request.getParameter("faculty");
			String department  = request.getParameter("department");
			String gender  = request.getParameter("gender");
			String batch  = request.getParameter("batch");
			String fullRoll = getFullRollNo(rollNo, faculty, batch);
			
			//Address Variables
			String country        = request.getParameter("country");
			String province       = request.getParameter("province");
			String city 		  = request.getParameter("city");
			String areaStreetHome = request.getParameter("areaStreetHome");
			
			Address address = new Address();
			address.setCountry(country);
			address.setProvince(province);
			address.setCity(city);
			address.setStreet_area_houseNo(areaStreetHome);
			
			Member member = new Member();
			member.setAddress(address);
			member.setMember(membername);
			member.setFathername(fathername);
			member.setCnic(cnic);
			member.setRollNo(fullRoll);
			member.setGender(gender);
			member.setDepartment(department);
			
			if(mem_dao.addMember(member)){
				request.setAttribute("memmsg", "Member Succefully Save in Database");
			}else{
				request.setAttribute("memmsg", "Member Failed to Save");
			}
			request.getRequestDispatcher("addmember.jsp").forward(request, response);
		}
	}
	
	public String getFullRollNo(String roll,String faculty,String batch){
		
		String fullRollNo = "";
		switch(faculty){
		case "FASS":
			fullRollNo = batch+"-SS-"+roll;
		break;
		case "IT":
			fullRollNo = batch+"-IT-"+roll;
		break;
		case "FST":
			fullRollNo = batch+"-FST-"+roll;
		break;
		}
		
		return fullRollNo;
	}

}
