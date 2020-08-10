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
import com.entities.AddFirstTeamBowler;
import com.helper.FactoryProvider;

public class AddFirstTeamBowlerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddFirstTeamBowlerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
           int matchid=Integer.parseInt(request.getParameter("matchid").trim());
			
		    Session s= FactoryProvider.getFactory().openSession();
		    AddCricketSchedule match=(AddCricketSchedule) s.get(AddCricketSchedule.class, matchid);
		    
		    int id=new Random().nextInt(10000);
			
			String teamName=request.getParameter("fteamname");
			String player=request.getParameter("fplayer");
			int four=Integer.parseInt(request.getParameter("ffourCount").trim());
			int six=Integer.parseInt(request.getParameter("fsixCount").trim());;
			int other=Integer.parseInt(request.getParameter("fotherScore").trim());
			int wicket=Integer.parseInt(request.getParameter("wicket").trim());
			int wite=Integer.parseInt(request.getParameter("wite").trim());
			int no=Integer.parseInt(request.getParameter("no").trim());
			int totalBall=Integer.parseInt(request.getParameter("totalBall").trim());
			
			AddFirstTeamBowler addball=new AddFirstTeamBowler(id,matchid,teamName,player,four,six,other,wicket,wite,no,totalBall);
			
			Transaction tx=s.beginTransaction();
			s.save(addball);
			
			tx.commit();
			s.close();
			
			response.sendRedirect("operate_cricket_match.jsp?match_id="+matchid);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
