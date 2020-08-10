package com.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.AddTeam;
import com.helper.FactoryProvider;


@MultipartConfig
public class AddTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public AddTeamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id=new Random().nextInt(1000);
			String teamName=request.getParameter("teamName");
            String teamLogo=request.getParameter("teamLogo");

            Part part = request.getPart("photo");
            
			AddTeam at=new AddTeam(id,teamName,part.getSubmittedFileName());
	        Session session=FactoryProvider.getFactory().openSession();
			 Transaction tx=session.beginTransaction();
				session.save(at);
				
				tx.commit();
				session.close();
				
				
				
				String path=request.getRealPath("images")+File.separator+"teamLogo"+File.separator+part.getSubmittedFileName();
	    		//String path=request.getRealPath("image");
	    		System.out.println(path);
	    		
	    		//uploading code
	    		
	    		FileOutputStream fos=new FileOutputStream(path);
	   		
	    		InputStream is=part.getInputStream();
	    		
	    		//reading data
	    		byte[] data=new byte[is.available()];
	    		
	    		is.read(data);
	    		
	    		//writing the data
	    		
	    		fos.write(data);
	    		
	    		fos.close();
			
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				out.println("<h1 style='text-align:center;'>Team is Added Successfully<h1/>");
				out.println("<h1 style='text-align:center;'><a href='add_team_form.jsp'>Add Another Team</a><h1/>");
				out.println("<h1 style='text-align:center;'><a href='AdminPage.jsp'>Go To Home Page</a><h1/>");
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
