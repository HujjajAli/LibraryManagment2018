package com.lms.daoimplement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lms.dao.PublisherDAO;
import com.lms.dbresources.DBHandler;
import com.lms.model.Category;
import com.lms.model.Publisher;

public class PublisherDaoImplement implements PublisherDAO{

	private Connection con;
	
	public PublisherDaoImplement(){
		con = DBHandler.getConnection();
	}
	
	@Override
	public boolean addPublisher(Publisher publisher) {
		String query = "INSERT INTO publisher(publisher,country,foundingdate)VALUES('"+publisher.getPublisher()+"','"+publisher.getCountry()+"'"
				+ ",'"+publisher.getFoundingDate()+"')";
		System.out.println("Query==>:"+query);
		boolean exe = false;
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
	public List<Publisher> getAllPublisher() {
		List<Publisher> publishers = new ArrayList<Publisher>();
		String query = "select * from publisher";
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				Publisher publisher = new Publisher();
				publisher.setId(rs.getInt("id"));
				publisher.setPublisher(rs.getString("publisher"));
				publisher.setFoundingDate(rs.getString("foundingdate"));
				publisher.setCountry(rs.getString("country"));
				publisher.setNoOfBooks(rs.getInt("noOfBooks"));
				publishers.add(publisher);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return publishers;
		
	}
	
	
}
