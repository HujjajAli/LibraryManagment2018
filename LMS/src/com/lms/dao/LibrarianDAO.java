package com.lms.dao;

import com.lms.model.Librarian;
import com.lms.model.Login_Details;

public interface LibrarianDAO {
	
	public Librarian checkLibrarianByCNIC(String cnic);
	public Librarian checkLibrarianByUsername(String username);
	public Librarian insertLibrarian(Librarian librarian);
	public Librarian getLibrarianByUsername(String username);
	public int saveLogInfo(Login_Details details);
	public Login_Details getLoginDetails(String username);
}
