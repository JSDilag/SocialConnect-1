

<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>


<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Homepage</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/employee.css" rel="stylesheet">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        
    </head>

    <body>
        <header>
            <h1>SocialConnect</h1>
        </header>
        

            <ul class="navbar navbar-inverse navbar-fixed-top">
                <li class="navbar-item"><a href="EmployeeHomepage.jsp">Home</a></li>
                <li class="navbar-item"><a href="Messages.jsp">Messages</a></li>
                <li class="navbar-item"><a href="EmployeeAdvertisements.jsp">My Advertisements</a></li>
                <li class="navbar-item"><a href="EmployeeOrderReceipts.jsp">Customer Order Receipts</a></li>
                <li class="navbar-item"><a href="EmployeeInformation.jsp">Other employees</a></li>
                <li class="navbar-item"><a href="logout.jsp">Log out</a></li>
            </ul>

        <div style="clear: both;"></div>

        <!-- Displays the info of the employee -->
        <div id="my-info">
            
            <%
                String ID = (String) session.getAttribute("login");
                String query = "SELECT * FROM Employee E "
                            + "WHERE E.EmployeeID = " + ID + ";";
                java.sql.ResultSet rs = DBConnection.ExecQuery(query);
                if(rs.next())
                {
            %>
            <h3><b><%out.print(rs.getString("FirstName") + " " + rs.getString("LastName"));%></b></h3>
            <span>ID: 
                <%
                    out.print(ID); 
                %><br>
            </span>
            <span>Address: 
                <%
                    out.print(rs.getString("Address"));
                %><br>
            </span>
            <span>City: 
                <%
                    out.print(rs.getString("City"));
                %><br>
            </span>
            <span>State: 
                <%
                    out.print(rs.getString("State"));
                %><br>
            </span>
            <span>Zip Code: 
                <%
                    out.print(rs.getString("ZipCode"));
                %><br>
            </span>
            <span>Phone Number: 
                <%
                    out.print(rs.getString("Telephone"));
                %><br>
            </span>
            <span>Start Date: 
                <%
                    out.print(rs.getString("StartDate"));
                %><br>
            </span>
            <span>Hourly Rate: $
                <%
                    out.print(rs.getString("HourlyRate"));
                }
                %><br>
            </span>
        </div>
        
        <!-- Division for employee-level transactions  -->
        <div id="employee-abilities">
            <div class="function-border">
                <span>Advertisement functions</span>
                <br>
                <button class="buttons" onclick="location.href='CreateAdvertisement.jsp'">Create an Advertisement</button>
                <button class="buttons" onclick="location.href='DeleteAdvertisement.jsp'">Delete Advertisement</button>
            </div>
            <div class="function-border">
                <span>Transaction functions</span>
                <br>
                <button class="buttons" onclick="location.href='RecordATransaction.jsp'">Record a Transaction</button>
            </div>
            <div class="function-border">
                <span>Customer functions</span>
                <br>
                <button class="buttons" onclick="location.href='CreateCustomer.jsp'">Create Customer</button>
                <button class="buttons" onclick="location.href='EditCustomer.jsp'">Edit Customer</button>
                <button class="buttons" onclick="location.href='DeleteCustomer.jsp'">Delete Customer</button>
                <button class="buttons" onclick="location.href='CustomerMailingList.jsp'">Customer Mailing List</button>
                <button class="buttons" onclick="location.href='CustomerItemSuggestions.jsp'">Customer Item Suggestions</button>
            </div>
        </div>

        <footer>
            <p>&copy;2015 SocialConnect. Steven Liao</p>
        </footer>
    </body>
</html>