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
<title>Add Member</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container">
<%@include file="admin_nav.jsp" %>

<div class="row mt-5">
        <div class="col-3">
        <div class="card">
        <h4 class="card-header bg-dark text-white">Manage Team</h4>
        <ul class="list-group">
          <li class="list-group-item">
            <a href="add_team_form.jsp" class="nav-link text-success" target="_parent">
              Add Team
            </a>
          </li>
          <li class="list-group-item">
            <a href="add_team_member.jsp" class="nav-link text-success">
              Add Team Member
            </a>
          </li>
          <li class="list-group-item">
            <a href="#" class="nav-link text-success">
              Create Product
            </a>
          </li>
          <li class="list-group-item">
            <a href="#" class="nav-link text-success">
              Manage Product
            </a>
          </li>
          <li class="list-group-item">
            <a href="#" class="nav-link text-success">
              Manage Order
            </a>
          </li>
        </ul>
      </div>
        </div>
        
    
    <div class="col-9"> 
        
     <div class="container">
   
    
    <div class="row">
    <div class="col-12">
    <h1>Add Team Player: </h1>
<form action="AddTeamMemberServlet" method="post" enctype="multipart/data-form">
  <div class="form-group">
    <label for="name">Player Name</label>
    <input type="text" name="playerName" class="form-control" id="name" aria-describedby="emailHelp">
    
  </div>
  <div class="form-group">
    <label for="pType">Select Player Type</label>
    <select name="playerType" class="form-control" id="pType">
      <option>Select Type</option>
      <option>Batsman</option>
      <option>Bowler</option>
      <option>Wicket-Keeper</option>
      <option>All-Rounder</option>
    </select>
  </div>
  <div class="form-group">
    <label for="team">Select Team Name</label>
    <select name="teamName" class="form-control" id="team">
      <option>Select Team</option>
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
    s.close();
    %>
    </select>
  </div>
  <button type="submit" class="btn btn-primary">Add Player</button>
</form>
    </div>
    
    </div>
    
    
    <div/>
      </div>
      </div>
</div>
</body>
</html>