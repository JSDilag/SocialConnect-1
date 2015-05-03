
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

        <title>SocialConnect Account</title>
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
                          <th> TransactionID </th>
                          <th>DateTime </th>
                          <th> AdvertisementID </th>    
                          <th> Quantity </th>  
                          <th> AccountNumber </th>  
                          <th> TotalPrice </th>                            
                      </tr>
                  </thead>
                  <tbody>
                  <% String IDs = session.getAttribute("login").toString();
                     int ID = Integer.parseInt(IDs);
                    String Query = "SELECT S.* FROM HasAccount H, Sale S WHERE H.CustomerID="+ID+" AND H.AccountNumber=S.AccountNumber";
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
                               <td > <% out.print(rs.getString(6)); %> </td><br>                                   
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
