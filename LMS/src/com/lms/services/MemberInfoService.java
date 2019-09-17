package com.lms.services;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberInfoService
 */
@WebServlet("/MemberInfoService")
public class MemberInfoService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInfoService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String faculty = request.getParameter("faculty");
		
		if(faculty.equals("IT")){
			out.println("<option value='ITC'>Information Technology Center</option>");
		}else if(faculty.equals("AE")){
			out.println("<option value='BE Agriculture Engineering'>BE Agriculture Engineering</option>");
		}else if(faculty.equals("FST")){
			out.println("<option value='FST'>Food Science and Technology</option>");
		}else if(faculty.equals("CPD")){
			out.println("<option value=''>Choose Department</option>");
			out.println("<option value='Agronomy'>Agronomy</option>");
			out.println("<option value='Harticulture'>Harticulture</option>");
			out.println("<option value='Plant Breeding and Gentics'>Plant Breeding and Gentics</option>");
			out.println("<option value='Soil Sceince'>Soil Sceince</option>");
			out.println("<option value='Crop Phisiology'>Crop Phisiology</option>");
			out.println("<option value='Bio Technology'>Bio Technology</option>");
		}else if(faculty.equals("FASS")){
			out.println("<option value=''>Choose Department</option>");
			out.println("<option value='Economics'>Economics</option>");
			out.println("<option value='Agriculture Extention'>Agriculture Extention</option>");
		}else if(faculty.equals("CPT")){
			out.println("<option value='Entomology'>Entomology</option>");
			out.println("<option value='Plant Pethology'>Plant Pethology</option>");
			out.println("<option value='Plant Protection'>Plant Protection</option>");
		}
	}

}
