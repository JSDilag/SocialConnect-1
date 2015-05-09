

<!--@page contentType="text/html" pageEncoding="UTF-8"-->
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SocialConnect</title>
    </head>
    <body>
        <header>
            <h1>SocialConnect</h1>
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
        <a href="ManagerHomepage.jsp"> Back to Homepage</a>
    </body>

</html>
