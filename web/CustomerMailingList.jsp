
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.ResultSet"%>-->

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Customer Mailing List</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/employee.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
    </head>

    <body>
        
        <h1>SocialConnect</h1>
        <h2>Customer Mailing List</h2>
        
        <table>
            <tr>
                <th>Customer Email Addresses</th>
            </tr>   
            <%
                String query = "SELECT C.Email FROM Customer C";
                java.sql.ResultSet rs = DBConnection.ExecQuery(query);

                while (rs.next())
                {
                    %>
                    <tr>
                        <td>
                            <% out.print(rs.getString(1)); %>
                        </td>
                    </tr>
                    <%
                }
            %>
        </table>
        <button><a href="">Return home</a></button>
    </body>

</html>
