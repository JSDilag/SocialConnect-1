<!--<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
-->
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Superman Shirt</title>
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
        <img src="images/supermanshirt.jpg"> 
        <% String Query = "SELECT A.Content FROM Advertisement A WHERE A.ItemName='Superman Shirt'";
           java.sql.ResultSet rs =DBConnection.ExecQuery(Query);

           if (rs.next())
           {  out.print(cs.getString(1)+" ");


            }  
        %>                
    </body>
</html>