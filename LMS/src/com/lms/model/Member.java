package com.lms.model;

public class Member {
	
	private int id;
	private String member;
	private String fathername;
	public String gender;
	private String rollNo;
	private String department;
	private String cnic;
	private Address address;
	private int numborrowedbooks;
	private int fines;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public String getFathername() {
		return fathername;
	}
	public void setFathername(String fathername) {
		this.fathername = fathername;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getCnic() {
		return cnic;
	}
	public void setCnic(String cnic) {
		this.cnic = cnic;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public int getNumborrowedbooks() {
		return numborrowedbooks;
	}
	public void setNumborrowedbooks(int numborrowedbooks) {
		this.numborrowedbooks = numborrowedbooks;
	}
	public int getFines() {
		return fines;
	}
	public void setFines(int fines) {
		this.fines = fines;
	}
	
	
}
