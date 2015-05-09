

<!--@page contentType="text/html" pageEncoding="UTF-8"-->
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
    <html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Items by Company</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/manager.css" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

    </head>
    <body>
        <a href="ItemsListByComp.jsp" class="right">Back</a>
        <jsp:include page = "ManagerNav.jsp"/>
        <br><br><header>
            <h2>View Items by Company</h2>
            <hr>
        </header>
        <TABLE BORDER="3" CELLSPACING="1" CELLPADDING="1">
            <TR> <TD ALIGN = "center">Advertisement ID</TD>
                <TD ALIGN = "center">Item Name</TD>
            </TR>
        <%
            String compName = request.getParameter("CompName");
            String query = "SELECT A.AdvertisementId, A.ItemName FROM Advertisement A "
                    + "Where A.Company = '" + compName + "';";
            java.sql.ResultSet rs = DBConnection.ExecQuery(query);

            while (rs.next()) {
                String advertisementID = rs.getString("AdvertisementID");
                String itemName = rs.getString("ItemName");
              
        %>


        
            <TR> <TD ALIGN = "center"><%out.println(advertisementID);%> </TD>
                <TD ALIGN = "center"><%out.println(itemName);%> </TD>
                
            </TR>

        <%
            }
        %>
        </TABLE>
        
    </body>

</html>
