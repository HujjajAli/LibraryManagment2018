package com.lms.daoimplement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.lms.dao.LibrarianDAO;
import com.lms.dbresources.DBHandler;
import com.lms.model.Address;
import com.lms.model.Librarian;
import com.lms.model.Login_Details;

public class LibrarianDaoImplement implements LibrarianDAO {

	private Connection con;
	
	public LibrarianDaoImplement(){
		con = DBHandler.getConnection();
	}
	
	@Override
	public Librarian getLibrarianByUsername(String username) {
		String query = "select * from librarian where email = '"+username+"' ";
		Librarian librarian = new Librarian();
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				librarian.setId(rs.getInt("id"));
				librarian.setLibrarian(rs.getString("librarian"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return librarian;
		
	}
	
	@Override
	public Librarian checkLibrarianByCNIC(String cnic) {
		String query = "select * from librarian where cnic = '"+cnic+"' ";
		Librarian librarian = null;
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			if(rs.next()){
				librarian = new Librarian();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return librarian;
	}
	
	@Override
	public Librarian checkLibrarianByUsername(String username) {
		String query = "select * from login_detials where username = '"+username+"' ";
		Librarian librarian = null;
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			if(rs.next()){
				librarian = new Librarian();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return librarian;
	}
	
	@Override
	public Login_Details getLoginDetails(String username) {
		String query = "select * from login_detials where username = '"+username+"' ";
		Login_Details details = new Login_Details();
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			if(rs.next()){
				details.setId(rs.getInt("id"));
				details.setUsername(rs.getString("username"));
				details.setPassword(rs.getString("upassword"));
				details.setSalt(rs.getString("salt"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return details;
	}
	
	@Override
	public Librarian insertLibrarian(Librarian lib) {
		Librarian checkLab = checkFirstRecordinTable();
		int addID = saveAddress(lib.getAddress());
		String query;
		if(checkLab == null){
			String columns = "INSERT INTO librarian(librarian,surname,gender,payscale,salary,cnic,email,dateOfJoining,address,role)VALUES";
			String values  = "('"+lib.getLibrarian()+"','"+lib.getSurname()+"','"+lib.getGender()+"','"+lib.getPayScale()+"',"+lib.getSalary()+","
						   + "'"+lib.getCnic()+"','"+lib.getEmail()+"','"+lib.getDateOfJoining()+"',"+addID+",'admin')";
			query = columns+values;
			System.out.println("Librarian Query :"+query);
			try(Statement stm = con.createStatement()){
				int row = stm.executeUpdate(query);
				if(row>0){
					System.out.println("Librarian Saved");
				}else{
					System.out.println("Librarian Failed To Save");
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}else{
			String columns = "INSERT INTO librarian(librarian,surname,gender,payscale,salary,cnic,email,dateOfJoining,address,role)VALUES";
			String values  = "('"+lib.getLibrarian()+"','"+lib.getSurname()+"','"+lib.getGender()+"','"+lib.getPayScale()+"',"+lib.getSalary()+","
						   + "'"+lib.getCnic()+"','"+lib.getEmail()+"','"+lib.getDateOfJoining()+"',"+addID+",'none')";
			query = columns+values;
			System.out.println("Librarian Query :"+query);
			try(Statement stm = con.createStatement()){
				int row = stm.executeUpdate(query);
				if(row>0){
					System.out.println("Librarian Saved");
				}else{
					System.out.println("Librarian Failed To Save");
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		Librarian retLab = new Librarian();
		query = "select * from librarian";
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				retLab.setId(rs.getInt("id"));
				retLab.setLibrarian(rs.getString("librarian"));
				retLab.setEmail(rs.getString("email"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return retLab;
		
	}
	
	public Librarian checkFirstRecordinTable(){
		Librarian librarian = null;
		String query = "select * from librarian";
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			if(rs.next()){
				librarian = new Librarian();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return librarian;
	}
	
	public int saveAddress(Address address){
		int id = 0;
		String query = "INSERT INTO lib_address(country,province,city,area_street_house)"
					 + "VALUES('"+address.getCountry()+"','"+address.getProvince()+"','"+address.getCity()+"','"+address.getStreet_area_houseNo()+"')";
		try(Statement stm = con.createStatement()){
			int row = stm.executeUpdate(query);
			if(row>0){
				System.out.println("Address Saved");
			}else{
				System.out.println("Address Failed To Save");
			}
			
			query = "select * from lib_address";
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				id = rs.getInt("id");
				System.out.println("ID==="+id);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return id;
	}
	
	public int saveLogInfo(Login_Details d){
		int id = 0;
		String query = "INSERT INTO login_detials(username,upassword,salt)values('"+d.getUsername()+"','"+d.getPassword()+"','"+d.getSalt()+"')";
		try(Statement stm = con.createStatement()){
			int row = stm.executeUpdate(query);
			if(row>0){
				System.out.println("Login Details Saved");
			}else{
				System.out.println("Login Details Failed To Save");
			}
			row = 0;
			query = "select * from login_detials";
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				id = rs.getInt("id");
				System.out.println("ID==="+id);
			}
			
			
			query = "update librarian set login_details = "+id+" where id = "+d.getId();
			row = stm.executeUpdate(query);
			if(row>0){
				System.out.println("Login Details Updated");
			}else{
				System.out.println("Login Details Failed To Updated");
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		
		
		return id;
		
	}

	

	/*public static void main(String[] args){
		LibrarianDaoImplement o = new LibrarianDaoImplement();
		Address a = new Address();
		a.setCity("Hyderabad");
		a.setCountry("Pakistan");
		a.setProvince("Sindh");
		a.setStreet_area_houseNo("Latif Abbad");
		int id = o.saveAddress(a);
		System.out.println("ID is :"+id);
		int id = o.saveLogInfo("a", "p", "s", 2);
		System.out.println("ID is :"+id);
	}*/

	

}
