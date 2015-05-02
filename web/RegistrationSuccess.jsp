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
            String FirstName = request.getParameterValues("FirstName");
            String LastName = request.getParameterValues("LastName");
            String Sex = request.getParameterValues("Sex");
            String Email = request.getParameterValues("Email");
            String DOB = request.getParameterValues("DOB");
            String Address = request.getParameterValues("Address");
            String City = request.getParameterValues("City");
            String State = request.getParameterValues("State");
            String ZipCode = request.getParameterValues("ZipCode");
            String Telephone = request.getParameterValues("Telephone");
            String Password = request.getParameterValues("Password");
            String Query = "INSERT INTO Customer VALUES (100100101 +", "+FirstName+", "+LastName+", "+Sex+", "+Email+", "+DOB+", "+Address+", "+City+", "+State+", "+ZipCode+", "+Telephone+", "+ 1  +", "+Password)" ;

            java.sql.ResultSet rs = DBConnection.ExecQuery(Query);
            Query = "INSERT INTO Account VALUES ("+ID+", "+99910100+", '2015-05-07', "+CreditCardNum")";
            DBConnection.ExecQuery(Query);
            QUery= "INSERT INTO HasAccount ("+ID", "+99910100+")";
            DBConnection.ExecQuery(Query);
            String select[] = request.getParameterValues("Preferences"); 
            if (select != null && select.length != 0) 
              {  for (int i = 0; i < select.length; i++) 
                 {   DBConnection.ExecQuery("INSERT INTO Preferences VALUES ("+ID+", "+select[i]+")");
                 }
              }

        %>
        <div class="alert alert-success">
            <center>
                <h4>Well done! Registration was successful.</h4>
                <h6> <a href="index.html">Return</a></h6>
            </center>
        </div>
    </body>
</html>