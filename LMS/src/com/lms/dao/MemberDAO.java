package com.lms.dao;

import java.util.List;

import com.lms.model.Address;
import com.lms.model.Member;

public interface MemberDAO {
	
	public boolean addMember(Member member);
	public int saveAddress(Address address);
	public List<Member> getAllMembers();
	public List<Member> getMembersByParameters(String batch,String department);
	public Member getMemberByRollNumber(String rollNumber);
	public Address getAddressByID(int id);

}
