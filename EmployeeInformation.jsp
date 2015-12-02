<%
if (request.getProtocol().compareTo("HTTP/1.0")==0)
      response.setHeader("Pragma","no-cache");
if (request.getProtocol().compareTo("HTTP/1.1")==0)
      response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires",0);

if(session.getValue("login")==null ){
  response.sendRedirect("index.htm");
}
//int empID = session.getValue("employeeID");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Your Employee Information -- Online Auction System</title>

</head>
<body style="text-align: center" bgcolor="#ffffff">
<h1>Employee Home Page</h1>
    <span style="font-size: 14pt; font-family: Arial"><strong>Hello, Employee. Your Email is
        <%=session.getValue("login")%>. Your ID is <%=session.getValue("employeeID")%> Here is Your Employee Information.<br />
        <br />

        <%
  
          String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
          String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu/sikwong"; 
          String mysUserID = "sikwong"; 
          String mysPassword = "108620515";
          java.sql.Connection conn=null;
          try{
            Class.forName(mysJDBCDriver).newInstance();
            java.util.Properties sysprops=System.getProperties();
            sysprops.put("user",mysUserID);
            sysprops.put("password",mysPassword);
        
            //connect to the database
            conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            System.out.println("Connected successfully to database using JConnect");
      
            java.sql.Statement stmt1=conn.createStatement();
        
            java.sql.ResultSet rs = stmt1.executeQuery("select * from employee where EmployeeID='"+session.getValue("employeeID")+"'");
            while(rs.next()){
                if(rs.getInt("Level") == 1){
                    System.out.println("Manager");
        %>
        
       
                <a href="Manager_crud.jsp" target="_blank">Manger CRUD</a><br />
                <a href="manager_sales_report.jsp" target="_blank">Obtain A sales report for a particular month</a><br />
                <a href="manager_comprehensive_item.jsp" target="_blank">Comprehensive List of Items</a><br />
                
                List of Sales : <a href="manager_listofsalesby_item_customer.jsp?by=item" target="_blank">By Item name</a> &nbsp &nbsp<a href="manager_listofsalesby_item_customer.jsp?by=customer" target="_blank">By customer name</a><br />

                Summary Listing of Revenue Generated By a particular  : <a href="manager_summary_listing.jsp?by=item" target="_blank">Item</a> &nbsp &nbsp<a href="manager_summary_listing.jsp?by=type" target="_blank">Item Type</a>  &nbsp &nbsp<a href="manager_summary_listing.jsp?by=customer" target="_blank">Customer</a><br />

                <a href="manager_cr_most_revenue.jsp" target="_blank">Customer Representative generated most total revenue</a><br />

                <a href="manager_customer_most_revenue.jsp" target="_blank">Customer generated most total revenue</a><br />

                <a href="manager_bestsellers_items.jsp" target="_blank">Best Sellers List of items</a><br />
        <%                
               // response.sendRedirect("Manager_crud.jsp");
              }
                else{
                   System.out.println("Customer Representative");
         %>
                  <a href="CustomerR_edit.jsp" target="_blank">Customer-Representative Edit</a><br />
                  <a href="customer_mailing.jsp" target="_blank">Customer mailing lists</a><br />
                  <a href="listSuggestion.jsp" target="_blank">Item suggestions</a><br />
                  <a href="view_employee.jsp" target="_blank">View Employee Information</a><br />
         <%     
                }
          %>     
                
        <%
            }

          }catch(Exception e){
            e.printStackTrace();
            out.print(e.toString());
          }
          finally{
            try{conn.close();}catch(Exception ee){};
          }



        %>
        
<%
	/*	String crscode=request.getParameter("crscode");
        
		String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
		String mysURL = "jdbc:mysql://sbcstldb.cs.stonybrook.edu:3306/cse305ta"; 
		String mysUserID = "cse305ta"; 
		String mysPassword = "107724115";
        
        String profId = ""+session.getValue("login");
  			java.sql.Connection conn=null;
			try 
			{
            	Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
            			conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            			System.out.println("Connected successfully to database using JConnect");
            
            			java.sql.Statement stmt1=conn.createStatement();
        
					java.sql.ResultSet rs = stmt1.executeQuery("select * from Course where Course.InsNo='"+profId+"'");
      	  while(rs.next())
        	{
%>
                    <tr>
                      <td style="width: 84px">
                          <span style="font-size: 10pt"><%=rs.getString(1)%></span></td>
                      <td style="width: 187px">
                          <span style="font-size: 10pt"><%=rs.getString(2)%></span></td>
                        <td style="width: 74px">
                            <span style="font-size: 10pt"><%=rs.getString(3)%></span></td>
                        <td>
                        	<input type=button  onclick="javascript:window.open('FacultyDetailedCourseInfo.jsp?crscode=<%=rs.getString(1).trim()%>','_self');return;" value="View and Set Transcript">
        
                        </td>
                        		
                    </tr>
<%      		
        	}
  			} catch(Exception e)
			{
				e.printStackTrace();
				out.print(e.toString());
			}
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}*/

  %>
                    <br />
  					        <br />
                    <input id="Button1" type="button" value="Logout" onclick="window.open('index.htm','_self');" /><br />
                    <span style="font-size: 8pt">
                        <br />
                        DSY</span></td>
               
            </tr>
        </table>
    </strong></spanlogout>
</body>
</html>