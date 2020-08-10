
<nav class="navbar navbar-expand-lg navbar-dark purple">
  <a class="navbar-brand" href="AdminPage.jsp">AdminPage</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="AdminPage.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="live_score.jsp">LiveScore</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="add_schedule.jsp" >Schedule</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="add_team.jsp" >Add Team</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="add_news.jsp" >Add News</a>
      </li>
      <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Settings</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="admin_profile.jsp">Your Profile</a>
      
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="index.jsp">Logout</a>
    </div>
  </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="index.jsp">
      
      <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">LogOut</button>
    </form>
  </div>
</nav>
