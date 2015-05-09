
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

        <title>SocialConnect Create Circle</title>
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

    <body>
      <% String ID = session.getAttribute("login").toString();
          String Query;
         String circleID= request.getParameter("circleID"); 

         String circleName= request.getParameter("circleName");
         String circleType= request.getParameter("circleType");
      %>
    <jsp:include page="<%="nav"+".jsp"%>"/>


      <div class="background">
        <div class="innerBackground">
          <div class="container">
              <br><br><br><br><br>
            Create a circle based on the circleID, circleName, and circleType fields
            <br><br><br><br><br>
                    <form class="col-md-12 center-block" action="createCircleQuery.jsp" method="post">
                        <div class="form-group">
                            <input name="circleID" type="text" class="form-control input-lg" placeholder="circleID" autofocus>
                        </div>
                        <div class="form-group">
                            <input name="circleName" type="text" class="form-control input-lg" placeholder="circleName">
                        </div>
                        <div class="form-group">
                            <input name="circleType" type="text" class="form-control input-lg" placeholder="circleType">
                        </div>
                        <div class="form-group">                       
                            <button class="btn btn-primary btn-lg btn-block">Create Circle</button>                         
                        </div>  
                    </form>    
         
            <a href="CustomerHomepage.jsp">Return</a>  
          </div>
        </div>
      </div>

    </body>

</html>
