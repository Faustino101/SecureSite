<jsp:include page="navbar.jsp"/>

<body>
  <div class="container">
    <div class="row">
      <div class="col-sm-6">
        <!-- Start of Form -->
        <form action="register_action.jsp">
          <label>Your Name:</label>
          <input class="form-control" name="fullname" required="true" />
          <br>

          <label>Login ID:</label>
          <input class="form-control" name="user" required="true" />
          <br>

          <label>Password: (Minumim of 8 characters)</label>
          <input class="form-control" name="pass" type="password" required="true" id="pass" />
          <br>

          <input class="btn btn-primary" type="submit" value="Register"/>
        </form>

      </div>
      <div class="col-sm-6">
        <h2>Please register to read the most interesting blogs!</h2>
        <p> Post and read about security </p>
        <p> Blog about anything (As long it's about security. Strongly enforced) </p>
        <p> learn about security principals </p>
        <p> SQL injection... Get outta here! </p>
      </div>
    </div>
  </div>
</body>

<jsp:include page="footer.jsp" />

<!-- Javascript to ensure that a minimum password is entered -->
<script>
  $("form").submit(function(e){
    if( !checkPasswordLength($("#pass").val()) ){
      alert("Your password must be 8 characters minumum. Our web app only supports strong and secure passwords");
      e.preventDefault();
    }
  });

  function checkPasswordLength(str){
    if(str.length > 7){
      return true;
    } else {
      return false;
    }
  }
</script>
