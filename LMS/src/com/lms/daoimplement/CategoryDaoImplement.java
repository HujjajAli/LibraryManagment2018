package com.lms.daoimplement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lms.dao.CategoryDAO;
import com.lms.dbresources.DBHandler;
import com.lms.model.Category;

public class CategoryDaoImplement implements CategoryDAO{
	
	private Connection con;
	
	public CategoryDaoImplement(){
		con = DBHandler.getConnection();
	}

	@Override
	public boolean addCategory(Category category) {
		String query = "INSERT INTO category(category,description)VALUES('"+category.getCategory()+"','"+category.getDiscription()+"')";
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
	public Category getCategory(int id) {
		String query = "select * from category";
		Category category = new Category();
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			if(rs.next()){
				category.setId(rs.getInt("id"));
				category.setCategory(rs.getString("category"));
				category.setDiscription(rs.getString("description"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return category;
	}

	@Override
	public List<Category> getAllCategory() {
		List<Category> categories = new ArrayList<Category>();
		String query = "select * from category";
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				Category category = new Category();
				category.setId(rs.getInt("id"));
				category.setCategory(rs.getString("category"));
				category.setDiscription(rs.getString("description"));
				categories.add(category);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return categories;
	}
	
	/*public static void main(String[] args){
		CategoryDaoImplement d = new CategoryDaoImplement();
		List<Category> data = d.getAllCategory();
		for(Category c:data){
			System.out.println(c.getCategory()+"__"+c.getDiscription());
		}
	}*/
	
}
