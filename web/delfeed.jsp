<%@include file="driver.jsp" %>
<%
    Statement stmt = conn.createStatement();
    stmt.executeUpdate("delete from feedback where fid = "+request.getParameter("fid"));
    response.sendRedirect("viewfeed.jsp?msg=saved");
    %>