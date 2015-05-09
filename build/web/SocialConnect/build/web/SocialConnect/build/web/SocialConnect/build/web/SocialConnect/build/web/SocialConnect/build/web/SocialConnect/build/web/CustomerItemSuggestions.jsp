<%@page import="java.util.ArrayList"%>
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
        <title>Customer Item Suggestions</title>

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
            <h2>Create Customer</h2>
            <hr>
        </header>
        
        <a href="EmployeeHomepage.jsp" class="right">Return to homepage</a>
        
        <form style="width: 50%;">
            <div class="form-group">
                <label for="inputCustomerID">Enter Customer ID to produce item suggestions</label>
                <input type="number" class="form-control" id="inputCustomerID" name="customerid">
            </div>
            <button type="submit" name="btnProduce">Produce list</button>
        </form>
        
        <%
            if (request.getParameter("btnProduce") != null)
            {
                String customerID = request.getParameter("customerid");
                String accountNumber;
                String query;
                ResultSet rs;
                ArrayList<String> array;
                if (!customerID.isEmpty())
                {
                    // FIRST GET THE ACCOUNT NUMBER OF THE CUSTOMER
//                    query = "SELECT S.AccountNumber "
//                            + "FROM Sale S, Customer C, Account Ac "
//                            + "WHERE S.AccountNumber = Ac.AccountNumber "
//                            + "AND Ac.CustomerID = C.CustomerID "
//                            + "AND C.CustomerID = " + customerID + ";";
//                    rs = DBConnection.ExecQuery(query);
                    
                    // IF 
//                    if (rs.next()) 
//                    {
//                        accountNumber = rs.getString(1);
//                        query = "SELECT A.ItemName, A.AdvertisementID FROM Advertisement A "
//                                + "WHERE A.Employee = ? AND A.Quantity>0  AND A.Type IN "
//                                + "(SELECT DISTINCT (A.Type) FROM Advertisement A "
//                                + "INNER JOIN Sale S "
//                                + "INNER JOIN Customer C ON "
//                                + "A.AdvertisementID = P.Advertisement AND "
//                                + "S.User = C.CustomerID WHERE C.CustomerID = " +  customerID + ") ";
                        
                    query = "SELECT FirstName, LastName FROM Customer "
                            + "WHERE CustomerID = " + customerID + ";";
                    rs = DBConnection.ExecQuery(query);
                    
                    if (rs.next())
                    {
                        String firstname = rs.getString("firstname");
                        String lastname = rs.getString("lastname");
                        session.setAttribute("firstname", firstname);
                        session.setAttribute("lastname", lastname);
                    }
                    
                    query = "SELECT DISTINCT A.ItemName, A.AdvertisementID "
                            + "FROM Sale S, Advertisement A, Account Ac, Customer C "
                            + "WHERE C.CustomerID = " + customerID + " "
                            + "AND S.AdvertisementID = A.AdvertisementID "
                            + "AND Ac.CustomerID = C.CustomerID "
                            + "AND Ac.AccountNumber = S.AccountNumber"; 
                    rs = DBConnection.ExecQuery(query);
                    array = new ArrayList();

                    // SAVE ALL THE items and adIDs INTO AN ARRAY
                    while (rs.next())
                    {
                        String itemName = rs.getString("ItemName");
                        String adID = rs.getString("AdvertisementID");
                        array.add(itemName);
                        array.add(adID);
                    }
                    session.setAttribute("customerItemSuggestions", array);
                    response.sendRedirect("ShowCustomerItemSuggestions.jsp");
//                    }
                } else
                {
                    out.println("<script type=\"text/javascript\">\n"
                                + "alert('Customer ID cannot be empty!');\n"
                                + "</script>");
                }
            }
            
        %>
        
    </body>
</html>
