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
<title>Insert title here</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container-fluid p-0 m-0">
<nav class="navbar navbar-expand-lg navbar-dark purple">
  <a class="navbar-brand" href="index.jsp">ScoreBoard</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="live_match.jsp">Live Score</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="cricket.jsp" >Schedule</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="login.jsp" >ADMIN</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<%
    int match_id=Integer.parseInt(request.getParameter("match_id").trim());
	int id=match_id;
    Session s= FactoryProvider.getFactory().openSession();
	
    AddCricketSchedule match=(AddCricketSchedule) s.get(AddCricketSchedule.class, match_id);
    %>
<div class="row">
<dic class="col-md-12">
<h4 class="text-center"><%= match.getFirstTeam() %>   vs   <%= match.getSecondTeam() %></h4>

<%-- START SHOW BATSMAN PART  --%><%-- START SHOW BATSMAN PART  --%><%-- START SHOW BATSMAN PART  --%><%-- START SHOW BATSMAN PART  --%>
<h3>Batsman Record : </h3>
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
  <tfoot>
  <%
  int Tfour=0,Tsix=0,Tother=0,Ttotal=0;
  
  for(AddFirstTeamScore p:list1)
  {
	  Tfour+=p.getFour();
	  Tsix+=p.getSix();
	  Tother+=p.getOther();
	  Ttotal=(Tfour*4)+(Tsix*6)+Tother;
  }
  %>
  <tr class="bg-danger text-light">
  <td>#</td>
  <td><b>Team Total</b></td>
  <td><%=Tfour %></td>
  <td><%=Tsix%></td>
  <td><%=Tother%></td>
  <td><%=Ttotal%></td>
  </tr>
  
  </tfoot>
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
  <tfoot>
  <%
  int Tfour1=0,Tsix1=0,Tother1=0,Ttotal1=0;
  
  for(AddSecondTeamScore p:list2)
  {
	  Tfour1+=p.getFour();
	  Tsix1+=p.getSix();
	  Tother1+=p.getOther();
	  Ttotal1=(Tfour*4)+(Tsix*6)+Tother;
  }
  %>
  <tr class="bg-danger text-light">
  <td>#</td>
  <td><b>Team Total</b></td>
  <td><%=Tfour1 %></td>
  <td><%=Tsix1%></td>
  <td><%=Tother1%></td>
  <td><%=Ttotal1%></td>
  </tr>
  
  </tfoot>
</table>
  
  
  </div>
  </div>


<%-- end SHOW BATSMAN PART  --%><%-- END SHOW BATSMAN PART  --%><%-- END SHOW BATSMAN PART  --%><%-- END SHOW BATSMAN PART  --%>

<%-- START BOWLER PART  --%><%-- START BOWLER PART  --%><%-- START BOWLER PART  --%><%-- START BOWLER PART  --%>

<h3>Bowler Record : </h3>
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


<%-- END BOWLER PART  --%><%-- END BOWLER PART  --%><%-- END BOWLER PART  --%><%-- END BOWLER PART  --%>
</dic>
</div>
</div>

</body>
</html>