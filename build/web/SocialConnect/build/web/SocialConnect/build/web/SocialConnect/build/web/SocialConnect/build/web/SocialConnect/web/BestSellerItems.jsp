
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

        <title>SocialConnect Best-Seller Items</title>
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
    <jsp:include page="<%="nav"+".jsp"%>"/>
    <br><br><br><br><br>
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
                    String Query = "CREATE VIEW AdvertisementSales AS "
                            + "(SELECT S.AdvertisementID, COUNT(S.AdvertisementID)"
                            + " FROM Sale S GROUP BY S.AdvertisementID";                    
                    java.sql.ResultSet rs = DBConnection.ExecQuery(Query);
                    Query = "  SELECT A.* FROM Advertisement "
                            + "A INNER JOIN AdvertisementSales S ON "
                            + "A.AdvertisementID = S.AdvertisementID WHERE A.Quantity > 0";
                    rs = DBConnection.ExecQuery(Query);
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
