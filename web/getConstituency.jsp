<%@include file="driver.jsp" %>
<%
    String state = request.getParameter("state");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select constituency from state where state ='"+state+"'");
    while(rs.next()){
        out.print(rs.getString(1)+",");
    }
    %>