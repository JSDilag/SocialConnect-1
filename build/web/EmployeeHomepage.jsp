

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
        <title>Homepage Dashboard</title>

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
        
        <nav>
            <ul id="navbar">
                <li id="home" class="navbar-item"><a href="EmployeeHomepage.jsp">Home</a></li>
                <li id="messages" class="navbar-item">Messages</li>
                <li id="advertisements" class="navbar-item">My Advertisements</li>
                <li id="sales" class="navbar-item">My Transactions</li>
                <li class="navbar-item"><a href="logout.jsp">Log out</a></li>
            </ul>
        </nav>

        <div style="clear: both;"></div>

        <!-- Displays the info of the employee -->
        <div id="my-info">
            <h3>Profile</h3>
            <%
                String ID = (String) session.getAttribute("login");
                String query = "SELECT * FROM Employee E "
                            + "WHERE E.EmployeeID = " + ID + ";";
                java.sql.ResultSet rs = DBConnection.ExecQuery(query);
            %>
            <span>ID: 
                <%
                    out.print(ID); 
                %><br>
            </span>
            <span>
                Name: 
                <%
                    if(rs.next())
                    {
                        out.print(rs.getString("FirstName") + " " + rs.getString("LastName"));
                %><br>
            </span>
            <span>Address: 
                <%
                    out.print(rs.getString("Address") + ", " + rs.getString("City") + ", " +
                            rs.getString("State") + ", " + rs.getString("ZipCode"));
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
                <span style="border: solid black;">Advertisement functions</span>
                <br>
                <button class="buttons" onclick="location.href='CreateAdvertisement.jsp'">Create an Advertisement</button>
                <!--<h2>Delete an Advertisement</h2>-->
<!--                <form>
                    <div class="form-group">
                        <label for="inputAdID">Enter Advertisement ID to delete</label>
                        <input type="number" class="form-control" id="inputAdID" name="adid">
                    </div>
                    <button type="submit" class="buttons">Delete Advertisement</button>
                </form>-->
                <button class="buttons" onclick="location.href='DeleteAdvertisement.jsp'">Delete Advertisement</button>
            </div>
            <div class="function-border">
                <span style="border: solid black;">Transaction functions</span>
                <br>
                <button class="buttons" onclick="location.href='RecordATransaction.jsp'">Record a Transaction</button>
            </div>
            <div class="function-border">
                <span style="border: solid black;">Customer functions</span>
                <br>
                <button class="buttons" onclick="location.href='CreateCustomer.jsp'">Create Customer</button>
                <button class="buttons" onclick="location.href='EditCustomer.jsp'">Edit Customer</button>
                <button class="buttons" onclick="location.href='DeleteCustomer.jsp'">Delete Customer</button>
<!--                <form>
                    <div class="form-group">
                        <label for="inputCustomerID">Enter Customer ID to delete</label>
                        <input type="number" class="form-control" id="inputCustomerID" name="customerid">
                    </div>
                    <button type="submit" class="buttons">Delete Customer</button>
                </form>-->
                <button class="buttons" onclick="location.href='CustomerMailingList.jsp'">Customer Mailing List</button>
                <button class="buttons" onclick="location.href='CustomerItemSuggestions.jsp'">Customer Item Suggestions</button>
            </div>
        </div>

        <footer>
            <p>&copy;2015 SocialConnect. Steven Liao</p>
        </footer>
    </body>
</html>