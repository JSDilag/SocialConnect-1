
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
        <title>View Customers</title>
    </head>
    <body>
        <header>
            <h1>SocialConnect</h1>
            <h2>View Customers that purchased a particular item</h2>
            <hr>
        </header>
        <label for="inputAdID">Enter Advertisement ID: </label>
        <form class="form col-md-12 center-block" action="CustListByItemView.jsp" method="post">
            <div class="form-group">
                <input name="AdID" type="text" class="form-control input-lg" placeholder="33332" autofocus>
            </div>
            <div class="form-group">
                <button class="btn btn-primary btn-lg btn-block">Enter</button>
            </div>
        </form>
       


        
    </body>
</html>
