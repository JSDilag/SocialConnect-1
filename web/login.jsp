
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<%
	if ((request.getParameter("action") != null) && (request.getParameter("action").trim().equals("logout"))) {
		//session.putValue("login", "");
                session.setAttribute("login", "");
		response.sendRedirect("/");
		return;
	}

	String Id = request.getParameter("Id");
	String Password = request.getParameter("Password");
        String query=null;
	session.setAttribute("login", "");
	if ((Id!= null) && (Password != null))   /*Fields entered */
        {
            if (Idtrim().equals("") || Password.trim().equals(""))   /*If just whitespace */
             {   response.sendRedirect("index.html"); 
             } 
            else 
            {   query = "SELECT * FROM Customer WHERE CustomerId= '" +
                            Id+ "' AND Password = '" + Password  + "'";
               	java.sql.ResultSet rs = DBConnection.ExecQuery(query);
		        if (rs.next())
                  {  // login success
                    session.setAttribute("login", ID);
                    response.sendRedirect("CustomerHomepage.jsp");
		          } 
                
                else{
                        query = "SELECT * FROM Employee WHERE EmployeeId= '" +
                            Id+ "' AND Password = '" + Password  + "'";
                        rs = DBConnection.ExecQuery(query);
                        if (rs.next()) {
                            session.setAttribute("login", ID);
                            response.sendRedirect("EmployeeHomepage.jsp");
                        }
                        else {
				            // Idor Password mistake                           
                            out.print("Idor Password is not Correct!!!");
                            %>
                            <br/>
                            <a href="index.html"> Back to login page </a>
                            <%
                        }
                    }
			
            }
	}
    
%>