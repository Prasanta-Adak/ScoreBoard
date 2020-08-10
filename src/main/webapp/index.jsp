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
<title>Manage Cricket Schedule</title>
<%@include file="all_js_css.jsp" %>
</head>
<body class="bg-secondary">
<div class="container">
    <%@include file="navbar.jsp" %>
    
    
    <ul class="list-group list-group-horizontal-xl mt-2">
    
    <%
    Session s=FactoryProvider.getFactory().openSession();
    Query q=s.createQuery("from AddCricketSchedule");
    q.setFirstResult(0);
    q.setMaxResults(4);
    List<AddCricketSchedule> list=q.list();
    for(AddCricketSchedule schedule:list)
    {
    	%>
  <li class="list-group-item">
 
  <div class="card" style="width: 15rem;">
  <div class="card-body">
    <h5 class="card-title"><%= schedule.getFirstTeam() %></h5>
    <h6 class="card-subtitle mb-2 text-muted">v/s</h6>
    <h5 class="card-title"><%= schedule.getSecondTeam() %></h5>
    
    <h6 class="text-primary"><%= schedule.getMatchDate() %>  <%=schedule.getTime() %></h6>
    <a href="#" class="card-link">Full Match</a>
  </div>
</div>
  
  </li>
  
  <% 
    }
    
    %>
</ul>

<div class="row">
<div class="col-md-4">
<div class="list-group mt-3">
  <button type="button" class="list-group-item list-group-item-action active">
    LATEST NEWS
  </button>
  <%
  
  Query q1=s.createQuery("from AddNews");
  List<AddNews> list1=q1.list();
  for(AddNews news:list1)
  {
  %>
  <button type="button" class="list-group-item list-group-item-action"><%= news.getTitle() %></button>
  
  <%
  }
  %>
</div>
</div>

<div class="col-md-8">
<%
    
    for(AddNews news:list1)
    {
    	%>
<div class="card mb-3 mt-3">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="images/news/<%= news.getImage() %>" class="card-img mt-2 ml-2" alt="..." />
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%= news.getTitle() %></h5>
        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
      </div>
    </div>
  </div>
</div>
<% 
    }
    s.close();
    %>

</div>
</div>

    </div>
</body>
</html>
