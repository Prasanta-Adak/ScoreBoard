<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add news form</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>

<form action="AddNewsServlet" method="post" enctype="multipart/form-data" >
<div class="form-group">
    <label for="exampleFormControlSelect1">News Type</label>
    <select name="type" class="form-control" id="exampleFormControlSelect1">
      <option>Cricket</option>
      <option>FootBall</option>
      <option>BasketBall</option>
    </select>
  </div>
  <div class="form-group">
    <label for="newstitle">News Title</label>
    <input type="text" name="title" class="form-control" id="newstitle" aria-describedby="emailHelp">
    
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">News Image</label>
    <div class="custom-file mb-3">
    <input name="photo" type="file" class="custom-file-input" id="validatedCustomFile" required>
    <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
    <div class="invalid-feedback">Example invalid custom file feedback</div>
  </div>
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">News Description</label>
    <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>



</body>
</html>