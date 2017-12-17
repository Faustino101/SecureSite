<%@include file="session_helper.jsp" %>

<head>
  <!-- Putting imports here so we can use throughout the entire application -->
  <title> SecureBook </title>
  <!-- Allow for mobile view -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Importing Jquery Javascript :: Included sha256 for security -->
  <script
    src="https://code.jquery.com/jquery-2.2.4.min.js"
    integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
    crossorigin="anonymous"></script>

  <!-- Importing Bootstrap CSS + Javascript -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

  <!-- Importing Font Awesome Javascript to use stylish fonts as images -->
  <script src="https://use.fontawesome.com/6dada7126a.js"></script>

  <link href="custom_styles.css" rel="stylesheet">
</head>

<nav class="navbar navbar-default" id="secure-navbar">
  <div class="container-fluid">
    <!-- Mobile LIST! -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"> <i class="fa fa-lock"></i> SecureBook </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <%
          if (logged_in) {
            out.print("<li><a href='logout_action.jsp'>Sign out</a></li>");
          } else {
            out.print("<li><a href='login_form.jsp'>Sign in</a></li>");
            out.print("<li><a href='register_form.jsp'>Register</a> </li>");
          }
        %>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
