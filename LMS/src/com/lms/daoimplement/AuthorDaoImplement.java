package com.lms.daoimplement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lms.dao.AuthorDAO;
import com.lms.dbresources.DBHandler;
import com.lms.model.Author;

public class AuthorDaoImplement implements AuthorDAO{

	
	private Connection con;
	
	public AuthorDaoImplement(){
		con = DBHandler.getConnection();
	}
	
	@Override
	public boolean addAuthor(Author author) {
		String query = "INSERT INTO author(author,gender,dob,lifestatus,country)VALUES('"+author.getAuthor()+"','"+author.getGender()+"'"
				+ ",'"+author.getDob()+"','"+author.getLifestatus()+"','"+author.getCountry()+"')";
		System.out.println("Query ==>:"+query);
		boolean exe = false;
		try(Statement stm = con.createStatement()){
			int row = stm.executeUpdate(query);
			if(row>0){
				exe = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return exe;
	}

	@Override
	public Author getAuthor(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Author> getAllAuthors() {
		List<Author> authors = new ArrayList<Author>();
		String query = "select * from author";
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				Author author = new Author();
				author.setId(rs.getInt("id"));
				author.setAuthor(rs.getString("author"));
				author.setCountry(rs.getString("country"));
				author.setDob(rs.getString("dob"));
				author.setGender(rs.getString("gender"));
				author.setLifestatus(rs.getString("lifestatus"));
				authors.add(author);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return authors;
	}
	
	

}
