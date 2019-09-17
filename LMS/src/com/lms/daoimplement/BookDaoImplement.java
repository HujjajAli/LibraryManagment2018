package com.lms.daoimplement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.lms.dao.BookDAO;
import java.util.List;
import com.lms.dbresources.DBHandler;
import com.lms.model.Book;

public class BookDaoImplement implements BookDAO{
	
	private Connection con;
	
	public BookDaoImplement(){
		con = DBHandler.getConnection();
	}

	@Override
	public boolean addBook(Book book) {
		String query = "INSERT INTO book(book,edition,pages,category,author,publisher)VALUES('"+book.getBook()+"',"
				+ "'"+book.getEdition()+"','"+book.getPages()+"',"+book.getCategory()+","+book.getAuthor()+","+book.getPublisher()+")";
		boolean exe = false;
		System.out.println("Query==>:"+query);
		try(Statement stm = con.createStatement()){
			int row = stm.executeUpdate(query);
			if(row>0){
				exe = true;
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return exe;
	}

	@Override
	public List<Book> getAllBooks() {
		List<Book> books = new ArrayList<Book>();
		String query = "select * from book";
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				Book book = new Book();
				book.setId(rs.getInt("id"));
				book.setBook(rs.getString("book"));
				book.setEdition(rs.getString("edition"));
				book.setPages(rs.getInt("pages"));
				book.setCategory(rs.getInt("category"));
				book.setAuthor(rs.getInt("author"));
				book.setPublisher(rs.getInt("publisher"));
				
				books.add(book);
			}
		}catch(SQLException e){
			
		}
		return books;
	}

	@Override
	public List<Book> getBooksByParameters(String cat, String pub, String auth) {
		List<Book> books = new ArrayList<Book>();
		String query = "";
		
		if(pub.equals("") && auth.equals("")){
			query = "select * from book where category ="+cat;
		}else if(cat.equals("") && auth.equals("")){
			query = "select * from book where publisher ="+pub;
		}else if(pub.equals("") && cat.equals("")){
			query = "select * from book where author ="+auth;
		}else if(pub.equals("")){
			query = "select * from book where category ="+cat+" and author = "+auth;
		}else if(auth.equals("")){
			query = "select * from book where category ="+cat+" and publisher = "+pub;
		}else if(cat.equals("")){
			query = "select * from book where author ="+auth+" and publisher = "+pub;
		}else{
			query = "select * from book where category ="+cat+" and publisher = "+pub+" and author ="+auth;
		}
		
		try(Statement stm = con.createStatement()){
			System.out.println("Query :"+query);
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				Book book = new Book();
				book.setId(rs.getInt("id"));
				book.setBook(rs.getString("book"));
				book.setEdition(rs.getString("edition"));
				book.setPages(rs.getInt("pages"));
				book.setCategory(rs.getInt("category"));
				book.setAuthor(rs.getInt("author"));
				book.setPublisher(rs.getInt("publisher"));
				
				books.add(book);
			}
		}catch(Exception e){
			
		}
		return books;
	}

	@Override
	public List<Book> getBooksName(String bookName) {
		List<Book> books = new ArrayList<Book>();
		String query = "select * from book where book.book = '"+bookName+"' ";
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				Book book = new Book();
				book.setId(rs.getInt("id"));
				book.setBook(rs.getString("book"));
				book.setEdition(rs.getString("edition"));
				book.setPages(rs.getInt("pages"));
				book.setCategory(rs.getInt("category"));
				book.setAuthor(rs.getInt("author"));
				book.setPublisher(rs.getInt("publisher"));
				
				books.add(book);
			}
		}catch(SQLException e){
			
		}
		return books;
		
		
	}

}
