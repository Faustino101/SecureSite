<jsp:include page="navbar.jsp"/>
<body>
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <h1> Login </h1>
        <form method="post" action="login_action.jsp" id="login">
          <jsp:include page="error.jsp"/>
          <label>Login ID:</label>
          <input class="form-control" name="user" required="true" />
          <br>

          <label>Password:</label>
          <input class="form-control" name="pass" type="password" required="true" />
          <br>

          <input class="btn btn-primary" type="submit" value="Login"/>
        </form>
      </div>
    </div>
  </div>
<body>

<jsp:include page="footer.jsp" />
