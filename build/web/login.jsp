
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<%
	if ((request.getParameter("action") != null) && (request.getParameter("action").trim().equals("logout"))) {
		//session.putValue("login", "");
                session.setAttribute("login", "");
		response.sendRedirect("/");
		return;
	}

	String ID = request.getParameter("ID");
	String Password = request.getParameter("Password");
        String query=null;
	session.setAttribute("login", "");
	if ((ID != null) && (Password != null))
        {
            if (ID.trim().equals("") || Password.trim().equals(""))
             {   response.sendRedirect("index.html");
             } 
            else 
            {   query = "SELECT * FROM Customer WHERE CustomerID = '" +
                            ID + "' AND Password = '" + Password  + "'";
               	java.sql.ResultSet rs = DBConnection.ExecQuery(query);
		        if (rs.next())
                  {  // login success
                    session.setAttribute("login", ID);
                    response.sendRedirect("CustomerHomepage.jsp");
		          } 
                
                else{
                        query = "SELECT * FROM Employee WHERE EmployeeID = '" +
                            ID + "' AND Password = '" + Password  + "'";
                        rs = DBConnection.ExecQuery(query);
                        if (rs.next()) {
                            session.setAttribute("login", ID);
                            response.sendRedirect("EmployeeHomepage.jsp");
                        }
                        else {
				            // ID or Password mistake                           
                            out.print("ID or Password is not Correct!!!");
                            %>
                            <br/>
                            <a href="index.html"> Back to login page </a>
                            <%
                        }
                    }
			
            }
	}
    
%>