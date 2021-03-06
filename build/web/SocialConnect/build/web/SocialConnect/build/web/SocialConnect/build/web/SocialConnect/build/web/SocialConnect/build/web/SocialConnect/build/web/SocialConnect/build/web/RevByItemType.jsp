

<!--@page contentType="text/html" pageEncoding="UTF-8"-->
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Revenue Listing</title>
    </head>
    <body>
        <header>
            <h1>SocialConnect</h1>
            <h2>View Revenue generated by Item Type</h2>
            <hr>
        </header>
        <TABLE BORDER="3" CELLSPACING="1" CELLPADDING="1">
            <TR> <TD ALIGN = "center">AdvertisementID</TD>
                <TD ALIGN = "center">Item Name</TD>
                <TD ALIGN = "center">Revenue</TD>
            </TR>
            <%
                String itemType = request.getParameter("ItemType");
                String query = "SELECT TS.AdvertisementId, TS.ItemName, TS.NumberSold * TS.UnitPrice "
                        + "AS Revenue FROM TotalSale TS, Advertisement A where TS.AdvertisementID = "
                        + "A.AdvertisementID AND A.Type = '" + itemType + "'";
                java.sql.ResultSet rs = DBConnection.ExecQuery(query);

                while (rs.next()) {
                    String advertisementID = rs.getString("AdvertisementID");
                    String itemName = rs.getString("ItemName");
                    String revenue = rs.getString("Revenue");
            %>



            <TR> <TD ALIGN = "center"><%out.println(advertisementID);%> </TD>
                <TD ALIGN = "center"><%out.println(itemName);%> </TD>
                <TD ALIGN = "center"><%out.println(revenue);%> </TD>

            <%
                }
            %>
        </TABLE>
        <a href="ManagerHomepage.jsp"> Back to Homepage</a>
    </body>

</html>
