package com.lms.daoimplement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lms.dao.MemberDAO;
import com.lms.dbresources.DBHandler;
import com.lms.model.Address;
import com.lms.model.Member;

public class MemberDaoImplement implements MemberDAO{
	
private Connection con;
	
	public MemberDaoImplement(){
		con = DBHandler.getConnection();
	}

	@Override
	public boolean addMember(Member member) {
		int addID = saveAddress(member.getAddress());
		String columns = "INSERT INTO member(member,fathername,rollNo,department,cnic,address,noOfBooksBorrowed,fines,gender)VALUES";
		String values =  "('"+member.getMember()+"','"+member.getFathername()+"','"+member.getRollNo()+"','"+member.getDepartment()+"'"+
		",'"+member.getCnic()+"',"+addID+","+member.getNumborrowedbooks()+","+member.getFines()+",'"+member.getGender()+"')";
		String query = columns+values;
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
	public int saveAddress(Address address) {
		int id = 0;
		String query = "INSERT INTO mem_address(country,province,city,area_street_house)"
					 + "VALUES('"+address.getCountry()+"','"+address.getProvince()+"','"+address.getCity()+"','"+address.getStreet_area_houseNo()+"')";
		try(Statement stm = con.createStatement()){
			int row = stm.executeUpdate(query);
			if(row>0){
				System.out.println("Address Saved");
			}else{
				System.out.println("Address Failed To Save");
			}
			
			query = "select * from mem_address";
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

	@Override
	public List<Member> getAllMembers(){
		
		List<Member> members = new ArrayList<Member>();
		String query = "select * from member";
		System.out.println("Query: "+query);
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				Member member = new Member();
				member.setId(rs.getInt("id"));
				member.setMember(rs.getString("member"));
				member.setFathername(rs.getString("fathername"));
				member.setRollNo(rs.getString("rollNo"));
				member.setDepartment(rs.getString("department"));
				member.setGender(rs.getString("gender"));
				member.setCnic(rs.getString("cnic"));
				member.setFines(rs.getInt("fines"));
				member.setNumborrowedbooks(rs.getInt("noOfBooksBorrowed"));
				
				members.add(member);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return members;
	}
	
	@Override
	public List<Member> getMembersByParameters(String batch, String department) {
		
		List<Member> members = new ArrayList<Member>();
		String query = "select * from member where department = '"+department+"' and rollNo like '%"+batch+"%' ";
		System.out.println("Query: "+query);
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				Member member = new Member();
				member.setId(rs.getInt("id"));
				member.setMember(rs.getString("member"));
				member.setFathername(rs.getString("fathername"));
				member.setRollNo(rs.getString("rollNo"));
				member.setDepartment(rs.getString("department"));
				member.setGender(rs.getString("gender"));
				member.setCnic(rs.getString("cnic"));
				member.setFines(rs.getInt("fines"));
				member.setNumborrowedbooks(rs.getInt("noOfBooksBorrowed"));
				
				members.add(member);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return members;
	}
	
	@Override
	public Member getMemberByRollNumber(String rollNumber) {
		Member member = new Member();
		String query = "select * from member where rollNo = '"+rollNumber+"' ";
		System.out.println("Query: "+query);
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			if(rs.next()){
				
				member.setId(rs.getInt("id"));
				member.setMember(rs.getString("member"));
				member.setFathername(rs.getString("fathername"));
				member.setRollNo(rs.getString("rollNo"));
				member.setDepartment(rs.getString("department"));
				member.setGender(rs.getString("gender"));
				member.setCnic(rs.getString("cnic"));
				member.setFines(rs.getInt("fines"));
				member.setNumborrowedbooks(rs.getInt("noOfBooksBorrowed"));
				int addID = rs.getInt("address");
				member.setAddress(getAddressByID(addID));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return member;
	}
	
	@Override
	public Address getAddressByID(int id) {
		Address add = new Address();
		String query = "select * from mem_address where id = "+id;
		System.out.println("Query: "+query);
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			if(rs.next()){
				add.setCountry(rs.getString("country"));
				add.setProvince(rs.getString("province"));
				add.setCity(rs.getString("city"));
				add.setStreet_area_houseNo(rs.getString("area_street_house"));
			}
		}catch(SQLException e){
			System.out.println(e.getSQLState());
			e.printStackTrace();
		}	
		return add;
	}
	
	public static void main(String[] args){
		
		MemberDaoImplement d = new MemberDaoImplement();
		
		for(Member m:d.getAllMembers()){
			System.out.println(m.getGender());
			System.out.println(m.getMember());
		}
	}

	

	

	

	

}
