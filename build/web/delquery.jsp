<%@include file="driver.jsp" %>
<%
    Statement stmt = conn.createStatement();
    stmt.executeUpdate("delete from query where qid = "+request.getParameter("qid"));
    response.sendRedirect("viewquery.jsp?msg=saved");
    %>