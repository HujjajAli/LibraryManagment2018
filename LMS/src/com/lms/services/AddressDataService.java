package com.lms.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddressDataService
 */
@WebServlet("/AddressDataService")
public class AddressDataService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressDataService() {
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
		String action = request.getParameter("action");
		
		
		
		if(action.equals("country")){
			List<String> countries = getCountries();
			out.println("<option value=''>Select Country..</option>");
			Collections.sort(countries);
			for(String e:countries){
				out.println("<option value='"+e+"'>"+e+"</option>");
			}
		}else if(action.equals("sortaddress")){
			String find = request.getParameter("find");
			if(find.equals("province")){
				String country = request.getParameter("country");
				List<String> provinces = getProvinces(country);
				out.println("<option value=''>Select Province/State..</option>");
				for(String e:provinces){
					out.println("<option value='"+e+"'>"+e+"</option>");
				}
			}else if(find.equals("city")){
				String province = request.getParameter("province");
				List<String> cities = getCities(province);
				out.println("<option value=''>Select City..</option>");
				for(String e:cities){
					out.println("<option value='"+e+"'>"+e+"</option>");
				}
			}
		}
	}
	
	public List<String> getCountries(){
		List<String> list = new ArrayList<String>();
		list.add("Pakistan");
		list.add("Iran");
		list.add("Austrelia");
		list.add("Bangladesh");
		return list;
	}
	
	public List<String> getProvinces(String country){
		List<String> list = new ArrayList<String>();
		if(country.equals("Pakistan")){
			list.add("Sindh");
			list.add("Punjab");
		}else if(country.equals("Iran")){
			list.add("Asfahan");
			list.add("Balochistan");
		}
		
		return list;
	}
	
	public List<String> getCities(String province){
		List<String> list = new ArrayList<String>();
		if(province.equals("Sindh")){
			list.add("Karachi");
			list.add("Hyderbad");
			list.add("Badin");
			list.add("Matli");
			list.add("larkana");
			list.add("Sukkur");
			list.add("Dadu");
		}else if(province.equals("Punjab")){
			list.add("Lahore");
			list.add("Rawalpindi");
			list.add("Islamabad");
			list.add("Faisalabad");
		}
		return list;
	}

}
