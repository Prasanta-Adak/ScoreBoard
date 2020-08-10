package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.AddTeamMember;
import com.helper.FactoryProvider;

public class AddTeamMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddTeamMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 int id=new Random().nextInt(1000);
			String playerName=request.getParameter("playerName");
			String playerType=request.getParameter("playerType");
			String teamName=request.getParameter("teamName");
			
			AddTeamMember addmem=new AddTeamMember(id,playerName,playerType,teamName);
			 Session session=FactoryProvider.getFactory().openSession();
			 Transaction tx=session.beginTransaction();
				session.save(addmem);
				
				tx.commit();
				session.close();
				
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				out.println("<h1 style='text-align:center;'>Player is Added Successfully<h1/>");
				out.println("<h1 style='text-align:center;'><a href='add_team_member.jsp'>Add Another Player</a><h1/>");
				out.println("<h1 style='text-align:center;'><a href='AdminPage.jsp'>Go To Home Page</a><h1/>");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
