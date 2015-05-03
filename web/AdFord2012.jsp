<!--<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
-->
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
    <body >
        <img src="images/ford2012.jpg"> 
        <% String Query = "A.Content, A.ItemName, A.AdvertisementID FROM Advertisement A WHERE A.ItemName='2012-Mustang'";
           java.sql.ResultSet rs =DBConnection.ExecQuery(Query);

           if (rs.next())
           {  out.print(rs.getString(1)+" ");
              request.setParameter("ItemName", rs.getString(2)); 
              request.setParameter("AdID", rs.getString(3)); 
            }  
           else
           {  request.setParameter("ItemName", null);
                request.setParameter("AdID", null);

            }
        %>                
    </body>   
</html>