package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.*;
import com.helper.*;

public class LoginAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public LoginAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			Session s= FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
	        Admin admin=(Admin)s.get(Admin.class, 1);
	        
	        String dbemail=admin.getEmail().trim();
	        String dbpassword=admin.getPassword().trim();
	        
	        if(email.equals(dbemail) && password.equals(dbpassword))
	        {
	        	response.sendRedirect("AdminPage.jsp");
	        }
	        else
	        {
	        	response.sendRedirect("login.jsp");
	        }
	        tx.commit();
			s.close();
	       
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
