package com.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.AddNews;
import com.helper.FactoryProvider;

@MultipartConfig
public class AddNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			int id=new Random().nextInt(10000);
			String type=request.getParameter("type");
			String title=request.getParameter("title");
		
			String description=request.getParameter("description");
			Date date=new Date();
			
			 Part part = request.getPart("photo");
			
			AddNews an=new AddNews(id,type,title,part.getSubmittedFileName(),description,date);
			
			Session session=FactoryProvider.getFactory().openSession();
			 Transaction tx=session.beginTransaction();
				session.save(an);
				
				tx.commit();
				session.close();
				
				String path=request.getRealPath("images")+File.separator+"news"+File.separator+part.getSubmittedFileName();
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
	    		
	    		HttpSession httpSession=request.getSession();
	    		httpSession.setAttribute("message", "News is Added Successfully...");
	    		response.sendRedirect("add_news.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
