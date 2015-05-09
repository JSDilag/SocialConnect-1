<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
    <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Ford 2012</title>
    <link rel="shortcut icon" href="images/favicon-32x32.png" type="image/x-icon">
    <link rel="icon" href="images/favicon-32x32.png" type="image/x-icon">
    <meta name="generator" content="Bootply" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
            <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
        <link href="css/main.css" rel="stylesheet">
    </head>
    <body style="background-color: #E8D830">
       <jsp:include page="<%="nav"+".jsp"%>"/>
       <img style="width: 50%;" src="images/ford2012.jpg"> <br>
        <% String Query = "SELECT A.Content, A.ItemName, A.AdvertisementID FROM Advertisement A WHERE A.ItemName='2012-Mustang'";
           java.sql.ResultSet rs =DBConnection.ExecQuery(Query);
           
           if (rs.next())
           {  out.print(rs.getString(1)+" ");
              session.setAttribute("ItemName", rs.getString(2)); 
              session.setAttribute("AdID", rs.getString(3)); 
            }  
           else
           {  session.setAttribute("ItemName", null);
              session.setAttribute("AdID", null);
            }
        %> 
        <br>
        <a href="Sale.jsp">
             <input  name="Buy" type="submit" value="Buy" class="btn btn-primary">
        </a>
        &nbsp &nbsp &nbsp &nbsp
        <a href="CustomerHomepage.jsp">Return</a>                                        
    </body>   
</html>