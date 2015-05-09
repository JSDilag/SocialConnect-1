
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Record a Transaction</title>

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
            <h1>Social Connect</h1>
            <h2>Record transaction</h2>
            <hr>
        </header>
        
        <a href="EmployeeHomepage.jsp" class="right">Return to homepage</a>
        
<!--        <form style="width: 50%;">
            <div class="form-group">
                <label for="inputAdID">Advertisement ID</label>
                <input type="text" class="form-control" id="inputAdID" name="adid">
            </div>
            <div class="form-group">
                <label for="inputDate">Quantity</label>
                <input type="number" class="form-control" id="inputQuantity" name="quantity">
            </div>
            <div class="form-group">
                <label for="inputAccountNumber">Account Number</label>
                <input type="text" class="form-control" id="inputAccountNumber" name="accountnumber">
            </div>
            <div class="form-group">
                <label for="inputDate">Date</label>
                <input type="date" class="form-control" id="inputDate" name="date">
            </div>
            <button type="submit" name="btnRecord">Record</button>
            <%
                if (request.getParameter("btnRecord") != null)
                {
                    String accountNumber = request.getParameter("");
                    String quantity = request.getParameter("");
                    String totalPrice = request.getParameter("");
                    String dateTime = request.getParameter("");
                }
            %>
        </form>-->
        <table>
            <tr>
                <th>Transaction ID</th>
                <th>Date Time</th>
                <th>Advertisement ID</th>
                <th>Quantity</th>
                <th>Account Number</th>
            </tr>
            <%
                String employeeID = (String) session.getAttribute("login");
                
                // RETRIEVES ALL THE TRANSACTIONS WAITING TO BE RECORDED
                String query = "SELECT T.* FROM TransactionsApproval T, Advertisement A "
                        + "WHERE A.EmployeeID = " + employeeID + " "
                        + "AND A.AdvertisementID = T.AdvertisementID;";
                ResultSet rs = DBConnection.ExecQuery(query);
                int btnNumber = 0;
                
                while (rs.next())
                {
                    %>
                    <tr>
                        <td><%out.print(rs.getString("TransactionID"));%></td>
                        <td><%out.print(rs.getString("DateTime"));%></td>
                        <td><%out.print(rs.getString("AdvertisementID"));%></td>
                        <td><%out.print(rs.getString("Quantity"));%></td>
                        <td><%out.print(rs.getString("AccountNumber"));%></td>
                        <td>
                            <form>
                                <button type="submit" name="<%out.print("btnApprove" + btnNumber++);%>">
                                    Record</button>
                            </form>
                        </td>
                    </tr>
                    <%
                }
                
                // PLACE THE ResultSet CURSOR BACK TO THE TOP
                if (rs.first())
                {
                    for (int i = 0; i < btnNumber; i++)
                    {
                        if (request.getParameter("btnApprove" + i) != null)
                        {
                            // MOVE THE CURSOR TO THE CURRENT ROW WHERE THE
                            // APPROVE BUTTON WAS PRESSED
                            for (int j = 0; j < i; j++)
                            {
                                rs.next();
                            }
                            
                            String transactionID = rs.getString("TransactionID");
                            String datetime = rs.getString("DateTime");
                            String advertisementID = rs.getString("AdvertisementID");
                            String quantity = rs.getString("Quantity");
                            String accountnumber = rs.getString("AccountNumber");
                            
                            // DELETE IT FROM TransactionsApproval VIEW AND THEN
                            // ADD IT TO THE SALES TABLE
                            query = "DELETE FROM TransactionsApproval "
                                    + "WHERE TransactionID = " + transactionID + ";";
                            int updated = DBConnection.ExecUpdateQuery(query);
                            query = "INSERT INTO Sale VALUES(" + transactionID
                                    + ", '" + datetime + "', " + advertisementID + ", " + quantity
                                    + ", " + accountnumber + ");";
                            updated += DBConnection.ExecUpdateQuery(query);
                            query = "UPDATE Advertisement SET Quantity = Quantity - " 
                                    + Integer.parseInt(quantity) + " "
                                    + "WHERE AdvertisementID = " + advertisementID + ";";
                            updated += DBConnection.ExecUpdateQuery(query);
                            
                            if (updated > 0)
                            {
                                out.println("<script type=\"text/javascript\">\n"
                                + "alert('Transaction is successfully recorded!');\n"
                                + "location = \"RecordATransaction.jsp;\""
                                + "</script>");
                            }
                            
                            break;
                        }
                    }
                }
            %>
        </table>
        
    </body>
</html>
