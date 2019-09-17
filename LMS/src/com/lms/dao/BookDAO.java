package com.lms.dao;

import java.util.List;

import com.lms.model.Book;

public interface BookDAO {
	
	public boolean addBook(Book book);
	public List<Book> getAllBooks();
	public List<Book> getBooksByParameters(String cat,String pub,String auth);
	public List<Book> getBooksName(String bookName);

}
