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
        
        
        <div class="col-9" style="border:1px solid red;"> 
        <img src="images/icc.webp" alt="" style="height:100%; width:100%;"/>
       
      </div>
      </div>
</div>
</body>
</html>