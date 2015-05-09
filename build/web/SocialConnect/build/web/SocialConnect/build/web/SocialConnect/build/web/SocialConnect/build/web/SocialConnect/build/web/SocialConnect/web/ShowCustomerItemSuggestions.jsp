
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Edit Customer</title>

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
        <header>
            <h1>SocialConnect</h1>
            <h2>
                Customer Item Suggestions for 
                <% out.print(session.getAttribute("firstname") + " " + session.getAttribute("lastname"));%>
            </h2>
            <hr>
        </header>
        
        <a href="EmployeeHomepage.jsp" class="right">Return to homepage</a>
        
        <table>
            <tr>
                <th>Item Name</th>
                <th>Advertisement ID</th>
            </tr>
            <%
                ArrayList<String> array = (ArrayList) session.getAttribute("customerItemSuggestions");
                if (array != null)
                {
                    for (int i = 0; i < array.size(); i += 2)
                    {
                        %>          
                        <tr>
                            <td><%out.print(array.get(i));%></td>
                            <td><%out.print(array.get(i + 1));%></td>
                        </tr>
                        <%
                    }
                } else
                {
                    
                }
            %>
        </table>
    </body>
</html>
