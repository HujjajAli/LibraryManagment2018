package com.lms.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.AuthorDAO;
import com.lms.dao.CategoryDAO;
import com.lms.dao.PublisherDAO;
import com.lms.daoimplement.AuthorDaoImplement;
import com.lms.daoimplement.CategoryDaoImplement;
import com.lms.daoimplement.PublisherDaoImplement;
import com.lms.model.Author;
import com.lms.model.Category;
import com.lms.model.Publisher;

/**
 * Servlet implementation class BookInfoService
 */
@WebServlet("/BookInfoService")
public class BookInfoService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookInfoService() {
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
		if(action.equals("categories")){
			CategoryDAO cat_dao = new CategoryDaoImplement();
			List<Category> catList = cat_dao.getAllCategory();
			out.print("<option value=''>Select Book Category</option>");
			for(Category category:catList){
				out.print("<option value='"+category.getId()+"'>"+category.getCategory()+"</option>");
			}
			
		}else if(action.equals("authors")){
			AuthorDAO auth_dao = new AuthorDaoImplement();
			List<Author> authList = auth_dao.getAllAuthors();
			out.print("<option value=''>Select Book Author</option>");
			for(Author author:authList){
				out.print("<option value='"+author.getId()+"'>"+author.getAuthor()+"</option>");
			}
			
		}else if(action.equals("publisher")){
			PublisherDAO pub_dao = new PublisherDaoImplement();
			List<Publisher> pubList = pub_dao.getAllPublisher();
			out.print("<option value=''>Select Book Publisher</option>");
			for(Publisher publisher:pubList){
				out.print("<option value='"+publisher.getId()+"'>"+publisher.getPublisher()+"</option>");
			}
			
		}
		
	}

}
