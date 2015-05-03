
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

        <title>SocialConnect Item Suggestions</title>
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

          <div class="table-responsive">
              <table class="table table-bordered table-hover">
                  <thead>
                      <tr>
                          <th> AdvertisementID </th>
                          <th>EmployeeID </th>
                          <th> Type </th>    
                          <th> Date </th>  
                          <th> Company </th>  
                          <th> ItemName </th>  
                          <th> Content </th> 
                          <th> UnitPrice </th> 
                          <th> Quantity </th>                           
                      </tr>
                  </thead>
                  <tbody>
                  <% String IDs = session.getAttribute("login").toString();
                     int ID = Integer.parseInt(IDs);
                    String Query = "SELECT A.* FROM Advertisement A WHERE A.Type IN (SELECT P.Preference FROM Preferences P WHERE P.CustomerId = "+ID")";

                    java.sql.ResultSet rs = DBConnection.ExecQuery(Query);
                  
                          while(rs.next())
                          {
                             %>
                            <tr>
                               <td > <% out.print(rs.getString(1)); %> </td>
                               <td > <% out.print(rs.getString(2)); %> </td>
                               <td > <% out.print(rs.getString(3)); %> </td>      
                               <td > <% out.print(rs.getString(4)); %> </td>  
                               <td > <% out.print(rs.getString(5)); %> </td>  
                               <td > <% out.print(rs.getString(6)); %> </td>
                               <td > <% out.print(rs.getString(7)); %> </td>
                               <td > <% out.print(rs.getString(8)); %> </td>
                               <td > <% out.print(rs.getString(9)); %> </td><br>                                   
                            </tr>
                             <%         
                          }                                            
                    %> 
                  </tbody>
              </table>
          </div>  
          <a href="CustomerHomepage.jsp">Return</a>

  <body>


  </body>

</html>
