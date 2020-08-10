<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Team Form</title>
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
    <h1>Add All Team : </h1>
    <form action="AddTeamServlet" method="post" enctype="multipart/form-data">
    <div class="form-group">
    <label for="teamName">Team Name</label>
    <input type="text" name="teamName" class="form-control" id="teamName" aria-describedby="emailHelp">
    
  </div>
  <div class="form-group" >
    <label for="TeamLogo">Choose Team Logo</label>
    <input type="file" name="photo" class="form-control" id="TeamLogo">
  </div>
  
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
    </div>
    
    </div>
    
    
    <div/>
      </div>
      </div>
</div>
</body>
</html>