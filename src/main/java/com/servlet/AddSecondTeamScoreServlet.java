package com.servlet;

import java.io.IOException;

import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.AddCricketSchedule;
import com.entities.AddSecondTeamScore;
import com.helper.FactoryProvider;


public class AddSecondTeamScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddSecondTeamScoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int matchid=Integer.parseInt(request.getParameter("matchid").trim());
			
		    Session s= FactoryProvider.getFactory().openSession();
		    AddCricketSchedule match=(AddCricketSchedule) s.get(AddCricketSchedule.class, matchid);
		   int id=new Random().nextInt(10000);
			
			String teamName=request.getParameter("teamname");
			String player=request.getParameter("player");
			int four=Integer.parseInt(request.getParameter("fourCount").trim());
			int six=Integer.parseInt(request.getParameter("sixCount").trim());;
			int other=Integer.parseInt(request.getParameter("otherScore").trim());
			
			AddSecondTeamScore addScore=new AddSecondTeamScore(id,matchid,teamName,player,four,six,other);
			Transaction tx=s.beginTransaction();
			s.save(addScore);
			
			tx.commit();
			s.close();
			
			response.sendRedirect("operate_cricket_match.jsp?match_id="+matchid);
		    
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
