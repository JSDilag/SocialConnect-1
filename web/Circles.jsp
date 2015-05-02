<!--
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
-->
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SocialConnect Circles</title>
        <link rel="shortcut icon" href="images/favicon-32x32.png" type="image/x-icon">
        <link rel="icon" href="images/favicon-32x32.png" type="image/x-icon">
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--[if lt IE 9]>
                <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="css/main.css" rel="stylesheet"> 
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" ></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
        <script src="js/jquery.slides.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>


<body>
    <% String IDs = session.getAttribute("login").toString();
        int ID = Integer.parseInt(IDs);
        String Query;
        java.sql.ResultSet rs;
    %>

    <body>

    <%@ include file="nav.jsp" %>

<div class="background">
  <div class="innerBackground">
    <div class="container">
      <br><br>
      <div class="row">  
        <div class="col-xs-2">
          <center>
            <input name="circleID" type="circle" id="circleIDBox" class="form-control input-lg" placeholder="CircleID">
          </center>
        </div>
        <div class="col-xs-2">
          <center>
            <input name="userID" type="circle" id="userIDBox" class="form-control input-lg" placeholder="userID">
          </center>
        </div>   
        <div class="col-xs-2">
          <center>
            <input name="circleName" type="circle" id="circleNameBox" class="form-control input-lg" placeholder="CircleName">
          </center>
        </div>    
        <div class="col-xs-2">
          <center>
            <input name="circleType" type="circle" id="circleTypeBox" class="form-control input-lg" placeholder="CircleType">
          </center>
        </div>          
      </div>
      <div class="row">
        <div class="col-xs-2">
          <a href="createCircle.jsp">
            <input id="createCircleBtn" type="submit" value="Create Circle" class="btn btn-primary" >
          </a>  
        </div>
        <div class="col-xs-2">
          <a href="renameCircle.jsp">
            <input id="renameCircleBtn" type="submit" value="Rename Circle" class="btn btn-primary" >
          </a>  
        </div>
        <div class="col-xs-2">
          <a href="deleteCircle.jsp">
            <input id="deleteCircleBtn" type="submit" value="Delete Circle" class="btn btn-primary" >
          </a>  
        </div>
        <div class="col-xs-2">
          <a href="addToCircle.jsp">
            <input id="addToCircleBtn" type="submit" value="Add to Circle" class="btn btn-primary" >
          </a>  
        </div>
        <div class="col-xs-2">
          <a href="removeFromCircle.jsp">
            <input id="removeFromCircleBtn" type="submit" value="Remove From Circle" class="btn btn-primary" >
          </a>  
        </div>
      </div> 
      <div class="row">
        <div class="col-xs-2">
          <a href="joinCircle.jsp">
            <input id="joinCircleBtn" type="submit" value="Join Circle" class="btn btn-primary" >
          </a>  
        </div>
        <div class="col-xs-2">
          <a href="unjoinCircle.jsp">
            <input id="unjoinCircleBtn" type="submit" value="Unjoin Circle" class="btn btn-primary" >
          </a>  
        </div> 
        <div class="col-xs-2">
          <a href="viewUserCircle.jsp">
            <input id="viewUserCircleBtn" type="submit" value="View User's Circles" class="btn btn-primary" >
          </a>  
        </div>               
      </div>  
      <div class="row">
          <div class="table-responsive">
              <table class="table table-bordered table-hover">
                  <thead>
                      <tr>
                          <th> CircleID </th>
                          <th>CircleName </th>
                          <th> CircleType </th>                              
                      </tr>
                  </thead>
                  <tbody>
                  <%    
                          Query="SELECT C.CircleID, C.CircleName, C.Type FROM CircleMembership CM, Circle C WHERE CM.CustomerID="+userID+" AND CM.CircleID=C.CircleID";
                          rs= DBConnection.ExecQuery(Query);
                          while(rs.next())
                          {
                             %>
                            <tr>
                               <td > <% out.print(rs.getString(1)); %> </td>
                               <td > <% out.print(rs.getString(2)); %> </td>
                               <td > <% out.print(rs.getString(3)); %> </td>                                       
                            </tr>
                             <%         
                          }                                            
                    %> 
                  </tbody>
              </table>
          </div>                
      </div>
      <a href="CustomerHomepage.jsp">Return</a>    
    </div>
  </div>
</div>


            </body>

</html>
