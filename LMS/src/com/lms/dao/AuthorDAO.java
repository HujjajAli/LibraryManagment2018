package com.lms.dao;

import java.util.List;

import com.lms.model.Author;

public interface AuthorDAO {
	
	boolean addAuthor(Author author);
	Author getAuthor(int id);
	List<Author> getAllAuthors();
}
