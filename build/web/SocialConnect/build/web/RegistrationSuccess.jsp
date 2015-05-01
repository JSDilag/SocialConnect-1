<!--
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>

-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>SocialConnect Registration Success</title>
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

        <%
            String FirstName = session.getAttribute("FirstName");
            String LastName = session.getAttribute("LastName");
            String Sex = session.getAttribute("Sex");
            String Email = session.getAttribute("Email");
            String DOB = session.getAttribute("DOB");
            String Address = session.getAttribute("Address");
            String City = session.getAttribute("City");
            String State = session.getAttribute("State");
            String ZipCode = session.getAttribute("ZipCode");
            String Telephone = session.getAttribute("Telephone");
            String Preferences = session.getAttribute("Preferences");
            String Password = session.getAttribute("Password");
            String Query = "INSERT INTO Customer VALUES (100100101 +", "+FirstName+", "+LastName+", "+Sex+", "+Email+", "+DOB+", "+Address+", "+City+", "+State+", "+ZipCode+", "+Telephone+", "+Preferences+", "+ 1  +", "+Password)" ;

            java.sql.ResultSet rs = DBConnection.ExecQuery(Query);

        %>
        <div class="alert alert-success">
            <center>
                <h4>Well done! Registration was successful.</h4>
                <h6> <a href="index.html">Return</a></h6>
            </center>
        </div>
    </body>
</html>