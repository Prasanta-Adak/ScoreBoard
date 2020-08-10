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

<div class="container">
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

<%--- start side nav --%>

<div class="row mt-5">
        <div class="col-3">
        <div class="card">
        <h4 class="card-header bg-dark text-white">Schedule</h4>
        <ul class="list-group">
          <li class="list-group-item">
            <a href="cricket.jsp" class="nav-link text-success" target="_parent">
              Live Match
            </a>
          </li>
          <li class="list-group-item">
            <a href="all_upcoming_match.jsp" class="nav-link text-success">
              Upcoming Match
            </a>
          </li>
          <li class="list-group-item">
            <a href="#" class="nav-link text-success">
              Previous Match
            </a>
          </li>
         
        </ul>
      </div>
        </div>
        <div class="col-9">
        <%@include file="live_match.jsp" %>
        </div>>
        </div>
<%-- end side nav --%>

</div>
</body>
</html>