
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>


<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SocialConnect Send Message</title>
        <link rel="shortcut icon" href="images/favicon-32x32.png" type="image/x-icon">
        <link rel="icon" href="images/favicon-32x32.png" type="image/x-icon">
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--[if lt IE 9]>
                <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="css/main.css" rel="stylesheet"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
        <script src="js/jquery.slides.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>

    <% String ID = session.getAttribute("login").toString();
        java.sql.ResultSet rs;
    %>

    <body>

      <jsp:include page="<%="nav"+".jsp"%>"/>

  
      <div class="background">
        <div class="innerBackground">
            <br><br><br><br><br>
                <form class="col-md-12 center-block" action="sendMessageQuery.jsp" method="post">
                    ReceiverID
                    <div class="form-group">
                        <input name="MsgReceiverID" type="text" class="form-control input-lg" value="100100102" placeholder="100100102" autofocus>
                    </div>
                    Subject
                    <div class="form-group">
                        <input name="MsgSubject" type="text" class="form-control input-lg" value="You won!" placeholder="You won!">
                    </div>
                    Content
                    <div class="form-group">
                        <input name="MsgContent" type="text" class="form-control input-lg" value="Omega good job!" placeholder="Omega good job!">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-lg btn-block">Send</button>
                    </div>
                </form>              
              <a href="CustomerHomepage.jsp">Return</a>  
       </div>
      </div>
    </body>

</html>
