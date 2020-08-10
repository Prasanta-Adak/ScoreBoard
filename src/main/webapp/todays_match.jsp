<%@page import="org.hibernate.Query"%>
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
<title>live score</title>
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
            <a href="todays_match.jsp" class="nav-link text-success" target="_parent">
              Todays Match
            </a>
          </li>
          <li class="list-group-item">
            <a href="manage_cricket_schedule.jsp" class="nav-link text-success">
              All Match
            </a>
          </li>
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
        </ul>
      </div>
        </div>
        
    
    <div class="col-9"> 
        
     <div class="container">
    <h1>Todays Match :</h1>
    
    <div class="row">
    <div class="col-12">
    
    <%
    String date = new SimpleDateFormat("yyyy-MM-dd",   Locale.getDefault()).format(new Date());
    Session s=FactoryProvider.getFactory().openSession();
    Query q=s.createQuery("from AddCricketSchedule");
    List<AddCricketSchedule> list=q.list();
    for(AddCricketSchedule schedule:list)
    {
    	String matchDate=schedule.getMatchDate().trim();
    	if(matchDate.equals(date))
    	{
    	%>
    	
   <div class="card m-4">
  
  <div class="card-body">
    <h2 class="card-title"><%= schedule.getFirstTeam() %>   <span style="color:#e91e63">V/s</span>   <%= schedule.getSecondTeam() %></h2>
    
    
    <p><b class="text-primary"><%= schedule.getMatchDate() %></b></p>
    <p><b class="text-primary"><%= schedule.getTime() %></b></p>
    <a href="operate_cricket_match.jsp?match_id=<%= schedule.getId() %>" class="btn btn-dark">Operate</a>
    <a href="DeleteServlet?schedule_id=<%= schedule.getId() %>" class="btn btn-danger">Delete</a>
    
    <a href="edit.jsp?schedule_id=<%= schedule.getId() %>" class="btn btn-primary">Update</a>
  </div>
</div>
    	<% 
    }
    	
    }
    s.close();
    %>
    </div>
    
    </div>
    
    
    <div/>
      </div>
      </div>
</div>
</body>
</html>