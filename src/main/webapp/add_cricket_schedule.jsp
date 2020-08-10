<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Schedule</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container">
<%@include file="admin_nav.jsp" %>


<div class="row mt-5">
        <div class="col-3">
        <div class="card">
        <h4 class="card-header bg-dark text-white">Manage Schedule</h4>
        <ul class="list-group">
          <li class="list-group-item">
            <a href="add_cricket_schedule.jsp" class="nav-link text-success" target="_parent">
              Add Cricket Schedule
            </a>
          </li>
          <li class="list-group-item">
            <a href="manage_cricket_schedule.jsp" class="nav-link text-success">
              Manage Cricket Schedule
            </a>
          </li>
           <li class="list-group-item">
            <a href="todays_match.jsp" class="nav-link text-success" target="_parent">
              Todays Match
            </a>
          </li>
          <li class="list-group-item">
            <a href="manage_cricket_schedule.jsp" class="nav-link text-success">
              All Match
            </a>
          </li>
        </ul>
      </div>
        </div>
        
    
    <div class="col-9"> 
        
     <div class="container">
    <h1>Add cricket schedule</h1>
    <div class="row">
    <div class="col-12">
    
<form class="mt-4" action="AddCricketScheduleServlet" method="post">

<div class="form-group">
    <label for="exampleFormControlSelect1">Select Match Type</label>
    <select name="type" class="form-control" id="exampleFormControlSelect1">
      <option>select type...</option>
      <option>T20 International</option>
      <option>ODI</option>
      <option>Test Cricket</option>
      
    </select>
  </div>
  <div class="form-group">
    <label for="ftname">First Team Name</label>
    
    <select name="firstteam" class="form-control" id="ftname">
      <option>Select First Team</option>
      
      <%
    Session s=FactoryProvider.getFactory().openSession();
    Query q=s.createQuery("from AddTeam");
    List<AddTeam> list=q.list();
    for(AddTeam team:list)
    {
    	%>
      <option><%= team.getTeamName() %></option>
      <%
    }
      %>
    </select>
  
  </div>
  <div class="form-group">
    <label for="stname">Second Team Name</label>
   
    <select name="secondteam" class="form-control" id="stname">
      <option>Select Second Team</option>
   <%
   for(AddTeam team:list)
   {
   %>
      <option><%= team.getTeamName() %></option>
      
      <% 
    }
    s.close();
    %>
    </select>
    
  </div>
  <div class="form-group">
    <label for="matchdate">Match Date</label>
    <input type="date" name="matchdate" class="form-control" id="matchdate">
  </div>
  
   <div class="form-group">
    <label for="matchtime">Match Time</label>
    <input type="text" name="matchtime" class="form-control" id="matchtime">
  </div>
  <div class="form-group">
    <input type="text" name="live" class="form-control" id="matchlive" value="false" hidden>
  </div>
  <button class="btn btn-warning"><a href="add_schedule.jsp" style="color:white">Back</a></button>
  <button type="submit" class="btn btn-primary">Add Schedule</button>
</form>
    
    </div>
    
    </div>
    
    
    <div/>
      </div>
      </div>
</div>

</body>
</html>