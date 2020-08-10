package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.*;
import com.helper.FactoryProvider;

public class AddCricketScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AddCricketScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int id=new Random().nextInt(1000);
			String type=request.getParameter("type");
			 String firstTeam=request.getParameter("firstteam");
			 String secondTeam=request.getParameter("secondteam");
			 String matchDate=request.getParameter("matchdate");
			 String time=request.getParameter("matchtime");
			 String live=request.getParameter("live");
			 
			 AddCricketSchedule adds=new AddCricketSchedule(id,type,firstTeam,secondTeam,matchDate,time,live);
			 
			 
			 Session session=FactoryProvider.getFactory().openSession();
			 Transaction tx=session.beginTransaction();
				session.save(adds);
				
				tx.commit();
				session.close();
				
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				out.println("<h1 style='text-align:center;'>Schedule is Added Successfully<h1/>");
				out.println("<h1 style='text-align:center;'><a href='add_cricket_schedule.jsp'>Add Another Schedule</a><h1/>");
				out.println("<h1 style='text-align:center;'><a href='AdminPage.jsp'>Go To Home Page</a><h1/>");
				out.println("<h1 style='text-align:center;'><a href='add_schedule.jsp'>Go To Schedule Page</a><h1/>");
				
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
