
<!--
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>
-->

<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Manager Homepage</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/manager.css" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

    </head>

    <body>
        <jsp:include page = "ManagerNav.jsp"/>
        
        
    <!--     <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <ul id="navbar">
                <li><h1>SocialConnect</h1></li>
                <li id="home" class="navbar-item"><a href="ManagerHomepage.jsp">Home</a></li>
                <li id="messages" class="navbar-item">Messages</li>

        </nav> -->

        <div style="clear: both;"></div>

        <!-- Displays the info of the employee -->
        <br><br><div id="my-info">
            
            <%
                String ID = (String) session.getAttribute("login");
                String query = "SELECT * FROM Manager M "
                        + "WHERE M.ManagerID = " + ID + ";";
                java.sql.ResultSet rs = DBConnection.ExecQuery(query);
                if (rs.next()) {
                    String name = rs.getString("FirstName") + " " + rs.getString("LastName");
            %>
            <header><h3><b><%out.print(name);%></b></h3></header>
            <span>ID: 
                <%
                    out.print(ID);
                %><br>
            </span>
           
            <span>Address: 
                <%
                    out.print(rs.getString("Address") + ", " + rs.getString("City") + ", "
                            + rs.getString("State") + ", " + rs.getString("ZipCode"));
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
                <span style="border: whitesmoke;">Transactions and Sales...</span>
                <br>
                <button class="buttons" onclick="location.href = 'SalesReport.jsp'">Sales report by month</button>
                <!--<h2>Delete an Advertisement</h2>-->
                <!--                <form>
                                    <div class="form-group">
                                        <label for="inputAdID">Enter Advertisement ID to delete</label>
                                        <input type="number" class="form-control" id="inputAdID" name="adid">
                                    </div>
                                    <button type="submit" class="buttons">Delete Advertisement</button>
                                </form>-->
                <button class="buttons" onclick="location.href = 'ViewTransactions.jsp'">View Transactions</button>
                <button class="buttons" onclick="location.href = 'SumListOfRevenues.jsp'">Summary listing of revenues</button>
                <button class="buttons" onclick="location.href = 'EmpMostRevenue.jsp'">Employee that generated most revenue</button>
                <button class="buttons" onclick="location.href = 'CustMostRevenue.jsp'">Customer that generated most revenue</button>
                <button class="buttons" onclick="location.href = 'MostActiveItems.jsp'">Most active items</button>
                <button class="buttons" onclick="location.href = 'CustListByItem.jsp'">List of customers by item</button>
      
            </div>
            <div class="function-border">
                <span style="border: whitesmoke;">Advertisements...</span>
                <br>
                <button class="buttons" onclick="location.href = 'ItemsList.jsp'">List of items</button>
                <button class="buttons" onclick="location.href = 'ItemsListByComp.jsp'">List of items by company</button>
            </div>
            <div class="function-border">
                <span style="border: whitesmoke;">Manage Employees...</span>
                <br>
                <button class="buttons" onclick="location.href = 'CreateEmployee.jsp'">Add an Employee</button>
                <button class="buttons" onclick="location.href = 'EditEmployee.jsp'">Edit Employee information</button>
                <button class="buttons" onclick="location.href = 'DeleteEmployee.jsp'">Delete Employee</button>
                <!--                <form>
                                    <div class="form-group">
                                        <label for="inputCustomerID">Enter Customer ID to delete</label>
                                        <input type="number" class="form-control" id="inputCustomerID" name="customerid">
                                    </div>
                                    <button type="submit" class="buttons">Delete Customer</button>
                                </form>-->
                <!--<button class="buttons" onclick="location.href='CustomerMailingList.jsp'">Customer Mailing List</button>
                <button class="buttons" onclick="location.href='CustomerItemSuggestions.jsp'">Customer Item Suggestions</button>
                -->
            </div>
        </div>
        <!-- 
                <footer>
                    <p>&copy;2015 SocialConnect. Steven Liao</p>
                </footer> -->
    </body>
</html>