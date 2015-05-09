
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
        <title>View Transactions</title>
    </head>
    <body>
        <header>
            <h1>SocialConnect</h1>
            <h2>View Transactions...</h2>
            <hr>
        </header>
        <label for="inputCustName">By Customer: </label>
            <form class="form col-md-12 center-block" action="ViewTransByCust.jsp" method="post">
                <div class="form-group">
                    <input name="CustName" type="text" class="form-control input-lg" placeholder="Enter Customer Name" autofocus>
                </div>
                <div class="form-group">
                    <button class="btn btn-primary btn-lg btn-block">Enter</button>
                </div>
            </form>
        <label for="inputItemName">Or By Item Name: </label>
        <form class="form col-md-12 center-block" action="ViewTransByItem.jsp" method="post">
                <div class="form-group">
                    <input name="ItemName" type="text" class="form-control input-lg" placeholder="Enter Item Name" autofocus>
                </div>
                <div class="form-group">
                    <button class="btn btn-primary btn-lg btn-block">Enter</button>
                </div>
            </form>
            

            
    </body>
</html>
