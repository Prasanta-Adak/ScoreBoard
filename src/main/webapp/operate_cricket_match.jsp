<%@page import="org.hibernate.Query"%>

<%@page import="org.hibernate.query.*"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>operate cricket</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container-fluid p-0 m-0">
<%@include file="admin_nav.jsp" %>
<div class="row mt-4">
  <div class="col-2">
    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Operate Batsman Score</a>
      <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Operate Bowler</a>
      <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Add Live Commentry</a>
      <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Add Live News</a>
    </div>
  </div>
  <%
    int match_id=Integer.parseInt(request.getParameter("match_id").trim());
	int id=match_id;
    Session s= FactoryProvider.getFactory().openSession();
	
    AddCricketSchedule match=(AddCricketSchedule) s.get(AddCricketSchedule.class, match_id);
    %>
  <div class="col-10">
  <h4 class="text-center"><%= match.getFirstTeam() %>   vs   <%= match.getSecondTeam() %></h4>
  
  
  
    <div class="tab-content" id="v-pills-tabContent">
      <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
      
      
      <div class="container-fluid">
      <div class="row">
      <div class="col-6">
      <form>
      
      <div class="form-group">
    <label for="teamName">First Team</label>
    <input type="text" class="form-control" id="teamName"  value="<%= match.getFirstTeam() %>" disabled>
    
     </div>
    
  
  </form>
  
  <form action="AddFirstTeamScoreServlet?matchid=<%=match.getId() %>" method="post" >
  <div class="form-group">
  
  <input type="text" name="fteamname" class="form-control" id="fteamName"  value="<%= match.getFirstTeam() %>" hidden>
    <label for="fexampleFormControlSelect1">Select Player</label>
    <select name="fplayer" class="form-control" id="fexampleFormControlSelect1">
      <option>Select player..</option>
      <%
      String team=match.getFirstTeam().trim();
    		Query q=s.createQuery("from AddTeamMember");
    	    List<AddTeamMember> list=q.list();
    for(AddTeamMember players:list)
    {
    	String t=players.getTeamName().trim();
    	if(t.equals(team))
    	{
    %>
      <option><%= players.getPlayerName() %></option>
      
      <%
    	}
    }
      %>
    </select>
  </div>
  <div class="form-group">
    <label for="fexampleInputPassword1">Add Fours</label>
    <input name="ffourCount" type="number" class="form-control" id="fexampleInputPassword1" value="0">
  </div>
  
  <div class="form-group">
    <label for="fexampleInputPassword2">Add Six</label>
    <input name="fsixCount" type="number" class="form-control" id="fexampleInputPassword1" value="0">
  </div>
  <div class="form-group">
    <label for="fexampleInputPassword3">Other Score</label>
    <input name="fotherScore" type="number" class="form-control" id="fexampleInputPassword" value="0">
  </div>
  
  <button type="submit" class="btn btn-primary">Add</button>
</form>
  
  
  </div>
  
  <%-- Second Team add Score part --%>
  
  
  <div class="col-6"> 
  <form>
      
      <div class="form-group">
    <label for="teamName">Second Team</label>
    <input type="text" class="form-control" id="teamName"  value="<%= match.getSecondTeam() %>" disabled>
    
  </div>
    </form>
    
    
    <form action="AddSecondTeamScoreServlet?matchid=<%=match.getId() %>" method="post" >
  <div class="form-group">
  
  <input type="text" name="teamname" class="form-control" id="teamName"  value="<%= match.getSecondTeam() %>" hidden>
    <label for="exampleFormControlSelect1">Select Player</label>
    <select name="player" class="form-control" id="exampleFormControlSelect1">
      <option>Select player..</option>
      <%
      String team1=match.getSecondTeam().trim();
    		
    for(AddTeamMember players:list)
    {
    	String t=players.getTeamName().trim();
    	if(t.equals(team1))
    	{
    %>
      <option><%= players.getPlayerName() %></option>
      
      <%
    	}
    }
      %>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Add Fours</label>
    <input name="fourCount" type="number" class="form-control" id="exampleInputPassword1" value="0">
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword2">Add Six</label>
    <input name="sixCount" type="number" class="form-control" id="exampleInputPassword1" value="0">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword3">Other Score</label>
    <input name="otherScore" type="number" class="form-control" id="exampleInputPassword" value="0">
  </div>
  
  <button type="submit" class="btn btn-primary">Add</button>
</form>
  </div>
  
  <%-- Second Team add Score part END --%>
  
  </div>
  </div>
  <div class="row">
  <div class="col-6 mt-4">
  <table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Player Name</th>
      <th scope="col">Total Four</th>
      <th scope="col">Total six</th>
      <th scope="col">Other Score</th>
      <th scope="col">Total Score</th>
      
    </tr>
  </thead>
  <tbody>
  <%
  Query<AddFirstTeamScore> q1=s.createQuery("from AddFirstTeamScore where match_id="+id);
 
  List<AddFirstTeamScore> list1=q1.list();
  ArrayList<String> al=new ArrayList<String>();
  
   for(AddFirstTeamScore p:list1)
   {
	   if(!al.contains(p.getPlayer()))
	   {
		   al.add(p.getPlayer());
	   }
   }
   for(String pl:al)
   {
	   int four=0;
	   int six=0;
	   int other=0;
	   int total=0;
	   for(AddFirstTeamScore p:list1)
	   {
		   if(pl.equals(p.getPlayer()))
		   {
		   
		   four+=p.getFour();
		   six+=p.getSix();
		   other+=p.getOther();
		   total=(four*4)+(six*6)+other;
		   }
		  
	   }
	   
	   
  %>
    <tr>
      <th scope="row">*</th>
      <td><%= pl %></td>
   
      <td><%= four %></td>
      <td><%= six %></td>
      <td><%= other %></td>
      <td><%=total %></td>
    </tr>
       <%
   }
    %>
  </tbody>
</table>
  </div>
  <div class="col-6 mt-4">
  
  <table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Player Name</th>
      <th scope="col">Total Four</th>
      <th scope="col">Total six</th>
      <th scope="col">Other Score</th>
      <th scope="col">Total Score</th>
      
    </tr>
  </thead>
  <tbody>
  <%
  Query<AddSecondTeamScore> q2=s.createQuery("from AddSecondTeamScore where match_id="+id);
 
  List<AddSecondTeamScore> list2=q2.list();
  ArrayList<String> al1=new ArrayList<String>();
  
   for(AddSecondTeamScore p:list2)
   {
	   if(!al1.contains(p.getPlayer()))
	   {
		   al1.add(p.getPlayer());
	   }
   }
   for(String pl:al1)
   {
	   int four=0;
	   int six=0;
	   int other=0;
	   int total=0;
	   for(AddSecondTeamScore p:list2)
	   {
		   if(pl.equals(p.getPlayer()))
		   {
		   
		   four+=p.getFour();
		   six+=p.getSix();
		   other+=p.getOther();
		   total=(four*4)+(six*6)+other;
		   }
		  
	   }
	   
	   
  %>
    <tr>
      <th scope="row">*</th>
      <td><%= pl %></td>
   
      <td><%= four %></td>
      <td><%= six %></td>
      <td><%= other %></td>
      <td><%=total %></td>
    </tr>
       <%
   }
    %>
  </tbody>
</table>
  
  
  </div>
  </div>
      </div>
      
      
      <%--       START Operate Bowler part          --%>  <%--       START Operate Bowler part          --%>  <%--       START Operate Bowler part          --%>
      
      
      <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
      
      
      
      
      <div class="container-fluid">
      <div class="row">
      <div class="col-6">
      <form>
      
      <div class="form-group">
    <label for="teamName">First Team</label>
    <input type="text" class="form-control" id="teamName"  value="<%= match.getFirstTeam() %>" disabled>
    
     </div>
    
  
  </form>
  
  <form action="AddFirstTeamBowlerServlet?matchid=<%=match.getId() %>" method="post" >
  <div class="form-group">
  
  <input type="text" name="fteamname" class="form-control" id="fteamName"  value="<%= match.getFirstTeam() %>" hidden>
    <label for="fexampleFormControlSelect1">Select Bowler</label>
    <select name="fplayer" class="form-control" id="fexampleFormControlSelect1">
      <option>Select player..</option>
      <%
      String teamb=match.getFirstTeam().trim();
    		Query qb=s.createQuery("from AddTeamMember");
    	    List<AddTeamMember> listb=qb.list();
    for(AddTeamMember players:listb)
    {
    	String t=players.getTeamName().trim();
    	if(t.equals(team))
    	{
    %>
      <option><%= players.getPlayerName() %></option>
      
      <%
    	}
    }
      %>
    </select>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6">
    <label for="fexampleInputPassword1">Add Fours</label>
    <input name="ffourCount" type="number" class="form-control" id="fexampleInputPassword1" value="0">
  </div>
  
  <div class="form-group  col-md-6">
    <label for="fexampleInputPassword2">Add Six</label>
    <input name="fsixCount" type="number" class="form-control" id="fexampleInputPassword1" value="0">
  </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6">
    <label for="fexampleInputPassword3">Other Score</label>
    <input name="fotherScore" type="number" class="form-control" id="fexampleInputPassword4" value="0">
  </div>
  <div class="form-group col-md-6">
    <label for="addWicket">Wicket</label>
    <input name="wicket" type="number" class="form-control" id="addWicket" value="0">
  </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6">
    <label for="fexampleInputPassword4">Wite Ball</label>
    <input name="wite" type="number" class="form-control" id="fexampleInputPassword4" value="0">
  </div>
  <div class="form-group col-md-6">
    <label for="fexampleInputPassword4">No Ball</label>
    <input name="no" type="number" class="form-control" id="fexampleInputPassword4" value="0">
  </div>
  </div>
  <div class="form-group">
    <input name="totalBall" type="number" class="form-control" id="fexampleInputPassword4" value="1" hidden>
  </div>
  <button type="submit" class="btn btn-primary">Add</button>
</form>
  
  
  </div>
  
  <%-- Second Team Bowler part  start--%>
  
  
  <div class="col-6"> 
  <form>
      
      <div class="form-group">
    <label for="teamName">Second Team</label>
    <input type="text" class="form-control" id="teamName"  value="<%= match.getSecondTeam() %>" disabled>
    
  </div>
    </form>
    
    
    <form action="AddSecondTeamBowlerServlet?matchid=<%=match.getId() %>" method="post" >
  <div class="form-group">
  
  <input type="text" name="teamname" class="form-control" id="teamName"  value="<%= match.getSecondTeam() %>" hidden>
    <label for="exampleFormControlSelect1">Select Player</label>
    <select name="player" class="form-control" id="exampleFormControlSelect1">
      <option>Select player..</option>
      <%
      String teamb1=match.getSecondTeam().trim();
    		
    for(AddTeamMember players:list)
    {
    	String t=players.getTeamName().trim();
    	if(t.equals(teamb1))
    	{
    %>
      <option><%= players.getPlayerName() %></option>
      
      <%
    	}
    }
      %>
    </select>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6">
    <label for="exampleInputPassword1">Add Fours</label>
    <input name="fourCount" type="number" class="form-control" id="exampleInputPassword1" value="0">
  </div>
  
  <div class="form-group col-md-6">
    <label for="exampleInputPassword2">Add Six</label>
    <input name="sixCount" type="number" class="form-control" id="exampleInputPassword1" value="0">
  </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6">
    <label for="exampleInputPassword3">Other Score</label>
    <input name="otherScore" type="number" class="form-control" id="exampleInputPassword" value="0">
  </div>
  <div class="form-group col-md-6">
    <label for="addWicket">Wicket</label>
    <input name="wicket" type="number" class="form-control" id="addWicket" value="0">
  </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6">
    <label for="fexampleInputPassword4">Wite Ball</label>
    <input name="wite" type="number" class="form-control" id="fexampleInputPassword4" value="0">
  </div>
  <div class="form-group col-md-6">
    <label for="fexampleInputPassword4">No Ball</label>
    <input name="no" type="number" class="form-control" id="fexampleInputPassword4" value="0">
  </div>
  </div>
  <div class="form-group">
    <input name="totalBall" type="number" class="form-control" id="fexampleInputPassword4" value="1" hidden>
  </div>
  <button type="submit" class="btn btn-primary">Add</button>
</form>
  </div>
  
  <%-- Second Team Bowler part END --%>
  
  </div>
  </div>
      
      
     <%--- Show bowler record --%> 
     
     
   
     <div class="row">
  <div class="col-6 mt-4">
  <table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Bowler</th>
      <th scope="col">Four</th>
      <th scope="col">six</th>
      <th scope="col">Other</th>
      <th scope="col">wite</th>
      <th scope="col">no</th>
      <th scope="col">over</th>
      <th scope="col">wicket</th>
      <th scope="col">Total</th>
      
    </tr>
  </thead>
  <tbody>
  <%
  Query<AddFirstTeamBowler> qfb=s.createQuery("from AddFirstTeamBowler where match_id="+id);
 
  List<AddFirstTeamBowler> listFb=qfb.list();
  ArrayList<String> alFb=new ArrayList<String>();
  
   for(AddFirstTeamBowler p:listFb)
   {
	   if(!alFb.contains(p.getPlayer()))
	   {
		   alFb.add(p.getPlayer());
	   }
   }
   for(String pl:alFb)
   {
	   int four=0,six=0,other=0,wicket=0,total=0,wite=0,no=0,over=0,totalBall=0;
	   for(AddFirstTeamBowler p:listFb)
	   {
		   if(pl.equals(p.getPlayer()))
		   {
			   four+=p.getFour();
			   six+=p.getSix();
			   other+=p.getOther();
			   wicket+=p.getWicket();
			   wite+=p.getWite();
			   no+=p.getNo();
			   totalBall+=p.getTotalBall();
			   over=(totalBall-no-wite)/6;
			   total=(four*4)+(six*6)+other+wite+no;
		   }
		  
	   }
	   
	   
  %>
    <tr>
      <th scope="row">*</th>
      <td><%= pl %></td>
   
      <td><%= four %></td>
      <td><%= six %></td>
      <td><%= other %></td>
      <td><%= wite %></td>
      <td><%= no %></td>
      <td><%= over %></td>
      <td><%= wicket %></td>
      <td><%=total %></td>
    </tr>
       <%
   }
    %>
  </tbody>
</table>
  </div>
  <div class="col-6 mt-4">
  
  <table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Bowler</th>
      <th scope="col">Four</th>
      <th scope="col">six</th>
      <th scope="col">Other</th>
      <th scope="col">wite</th>
      <th scope="col">no</th>
      <th scope="col">over</th>
      <th scope="col">wicket</th>
      <th scope="col">Total</th>
      
    </tr>
  </thead>
  <tbody>
  <%
  Query<AddSecondTeamBowler> qSb=s.createQuery("from AddSecondTeamBowler where match_id="+id);
 
  List<AddSecondTeamBowler> listSb=qSb.list();
  ArrayList<String> alSb=new ArrayList<String>();
  
   for(AddSecondTeamBowler p:listSb)
   {
	   if(!alSb.contains(p.getPlayer()))
	   {
		   alSb.add(p.getPlayer());
	   }
   }
   for(String pl:al1)
   {
	   int four=0,six=0,other=0,wicket=0,total=0,wite=0,no=0,over=0,totalBall=0;
	   for(AddSecondTeamBowler p:listSb)
	   {
		   if(pl.equals(p.getPlayer()))
		   {
		   
		   four+=p.getFour();
		   six+=p.getSix();
		   other+=p.getOther();
		   wicket+=p.getWicket();
		   wite+=p.getWite();
		   no+=p.getNo();
		   totalBall+=p.getTotalBall();
		   over=(totalBall-no-wite)/6;
		   total=(four*4)+(six*6)+other+wite+no;
		   }
		  
	   }
	   
	   
  %>
    <tr>
      <th scope="row">*</th>
      <td><%= pl %></td>
   
      <td><%= four %></td>
      <td><%= six %></td>
      <td><%= other %></td>
      <td><%= wite %></td>
      <td><%= no %></td>
      <td><%= over %></td>
      <td><%= wicket %></td>
      <td><%=total %></td>
    </tr>
       <%
   }
    %>
  </tbody>
</table>
  
  
  </div>
  </div>
     
     
     <%--- Show bowler record END--%> 
      
      
      </div>
      
      
      <%--      End Operate Bowler part          --%>
      
      <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">...</div>
      <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
    </div>
    
  </div>
  </div>

</div>
</body>
</html>