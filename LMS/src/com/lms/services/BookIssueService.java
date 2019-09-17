package com.lms.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.BookDAO;
import com.lms.dao.MemberDAO;
import com.lms.daoimplement.BookDaoImplement;
import com.lms.daoimplement.MemberDaoImplement;
import com.lms.model.Address;
import com.lms.model.Book;
import com.lms.model.Member;

/**
 * Servlet implementation class BookIssueService
 */
@WebServlet("/BookIssueService")
public class BookIssueService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookDAO bookdao = new BookDaoImplement();
	MemberDAO memberdao = new MemberDaoImplement();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookIssueService() {
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
		
		if(action.equals("findbook")){
			String category  = request.getParameter("category");
			String publisher = request.getParameter("publisher");
			String author    = request.getParameter("author");
			
			List<Book> booklist = bookdao.getBooksByParameters(category, publisher, author);
			Set<String> bookset = new HashSet<String>();
			for(Book book:booklist){
				bookset.add(book.getBook());
			}
			for(String str:bookset){
				out.println("<option value='"+str+"'>"+str+"</option>");
			}
		}else if(action.equals("findbookedition")){
			String bookName  = request.getParameter("book");
			List<Book> booklist = bookdao.getBooksName(bookName);
			for(Book book:booklist){
				out.println("<option value='"+book.getEdition()+"'>"+book.getEdition()+"</option>");
			}
		}
		else if(action.equals("findmem")){
			String batch      = request.getParameter("batch");
			String department = request.getParameter("department");
			
			out.println("Find Library Member");
			
			List<Member> memberlist = memberdao.getMembersByParameters(batch, department);
			
			for(Member member:memberlist){
				out.println("<option value='"+member.getRollNo()+"'>"+member.getRollNo()+"</option>");
			}
		}else if(action.equals("findmember")){
			String rollNumber = request.getParameter("rollNumber");
			Member member = memberdao.getMemberByRollNumber(rollNumber);
			Address address = member.getAddress();
			
			request.setAttribute("member", member);
			request.setAttribute("address", address);
			request.getRequestDispatcher("memberinfo.jsp").forward(request, response);
		}
		
		
	}

}
