<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container">
<%@include file="navbar.jsp" %>
<form action="LoginAdminServlet" method="post">
<h1>Please LogIn :</h1>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input 
    type="email" 
    class="form-control" 
    id="exampleInputEmail1" 
    aria-describedby="emailHelp"
    name="email"
    placeholder="Enter your email here"
    >
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input 
    type="password" 
    class="form-control" 
    id="exampleInputPassword1"
    name="password"
    >
  </div>
 
  <button type="submit" class="btn btn-primary">LogIn</button>
</form>
</div>
</body>
</html>