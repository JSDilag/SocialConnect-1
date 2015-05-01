
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<%

    String ItemName = request.getParameter("ItemName");
    String Ids = session.getAttribute("login");
    int Id = Integer.parseInt(Ids);
    String query = "SELECT H.AccountID FROM HasAccount H WHERE CustomerID="+Id;
    int rs = DBConnection.ExecUpdateQuery(query);
    String ItemName = session.getAttribute("ItemName");
    String AdIdS = session.getAttribute("AdID");
    int AdID = Integer.parseInt(AdIdS);

    if ((ItemName!= null))   /*Fields entered and Customer has Account*/
        {
            if (ItemName.trim().equals(""))   /*If just whitespace */
             {   response.sendRedirect("CustomerHomepage.jsp"); 
             } 
            else  
            {   query = "INSERT INTO Sale VALUES ("+ 200010009+", '2015-05-07', "+AdID+", 1, 90010101)";
                rs = DBConnection.ExecQuery(query);
                if (rs.next())
                  { 
                    response.sendRedirect("saleSuccessful.jsp");
                  } 
                else {
                     response.sendRedirect("CustomerHomepage.jsp");               
                }
           }
        }   
    
%>