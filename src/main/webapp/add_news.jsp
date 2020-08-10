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
<title>Add News</title>
<%@include file="all_js_css.jsp" %>
</head>
<body style="background-color:#eeeeee">
<div class="container">
<%@include file="admin_nav.jsp" %>
<div class="row mt-4">
  <div class="col-3">
    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Add News</a>
      <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Manage Cricket News</a>
      <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Manage FootBall News</a>
      <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Manage BasketBall News</a>
    </div>
  </div>
  <div class="col-9">
    <div class="tab-content" id="v-pills-tabContent">
      <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab"><%@include file="add_news_form.jsp" %></div>
      <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
      
      <%
      Session s= FactoryProvider.getFactory().openSession();
      Query q=s.createQuery("from AddNews");
	    List<AddNews> list=q.list();
	    for(AddNews news:list)
	    {
	    	if(news.getType().equals("Cricket"))
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
        <p class="card-text"><%= news.getDescription() %></p>
        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
        <a href="#" class="btn btn-danger">Delete</a>
    
    <a href="#" class="btn btn-primary">Update</a>
      </div>
    </div>
  </div>
</div>
      <%
	    	}
	    }
      %>
      </div>
      <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
      
      <%
	    List<AddNews> list1=q.list();
	    for(AddNews news:list1)
	    {
	    	if(news.getType().equals("FootBall"))
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
        <p class="card-text"><%= news.getDescription() %></p>
        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
        <a href="#" class="btn btn-danger">Delete</a>
    
    <a href="#" class="btn btn-primary">Update</a>
      </div>
    </div>
  </div>
</div>
      <%
	    	}
	    }
      %>
      
      </div>
      <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
      
      
      <%
	    List<AddNews> list2=q.list();
	    for(AddNews news:list2)
	    {
	    	if(news.getType().equals("BasketBall"))
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
        <p class="card-text"><%= news.getDescription() %></p>
        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
        <a href="#" class="btn btn-danger">Delete</a>
    
    <a href="#" class="btn btn-primary">Update</a>
      </div>
    </div>
  </div>
</div>
      <%
	    	}
	    }
      %>
      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>