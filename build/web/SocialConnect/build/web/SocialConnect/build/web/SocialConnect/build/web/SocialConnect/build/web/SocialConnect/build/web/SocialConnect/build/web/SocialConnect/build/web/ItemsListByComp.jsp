
<!--@page contentType="text/html" pageEncoding="UTF-8" -->
<!--
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Listing</title>
    </head>
    <body>
        <header>
            <h1>SocialConnect</h1>
            <h2>View item by Company</h2>
            <hr>
        </header>
        <label for="inputCompany">Enter Company Name: </label>
        <form class="form col-md-12 center-block" action="ItemsListByCompView.jsp" method="post">
            <div class="form-group">
                <input name="CompName" type="text" class="form-control input-lg" placeholder="Ford" autofocus>
            </div>
            <div class="form-group">
                <button class="btn btn-primary btn-lg btn-block">Enter</button>
            </div>
        </form>
       


        
    </body>
</html>
