<%    if (((session.getAttribute("adhar")) == null) || ((session.getAttribute("Biometric")) == null)) {
        response.sendRedirect("invalid.jsp");
    }
    String type = (String) (session.getAttribute("type"));
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <link rel="stylesheet" type="text/css" href="menu.css"/>
        <script type="text/javascript" src="disable.js"></script>
        <script type="text/javascript" src="register.js"></script>
    </head>
    <body>
        <div id="wr" style="height: 1100px">
            <%@include file="header2.jsp" %>
            <div id="lw" style="height: 1000px">
                <%@include file="lw1.jsp" %>
                <div id="lw2" style="height: 800px">
                    <%
                        int st = Integer.parseInt(request.getParameter("value"));
                        int x = 24;
                        int lt = st + x;

                        session.setAttribute("lt", lt);
                    %>

                    <center><form action="setresult2.jsp" method="get">
                            <table id="table1" border="1">
                                <tr><th>State</th><th>Constituency</th><th>Party</th><th>Candidates</th><th>Save</th></tr>
                                        <%!String state, cons, winner, party;%>
                                        <%@include file = "driver.jsp" %> 
                                        <%
                                            ResultSet rset, rset2;
                                            Statement stmt;
                                            int i;
                                            try {
                                                stmt = conn.createStatement();
                                                for (i = st; i < lt; i++) {
                                                    rset = stmt.executeQuery("select state, constituency from state where cid=" + i + " and result = '" + 0 + "'");
                                                    if (rset.next()) {
                                                        state = rset.getString(1);
                                                        cons = rset.getString(2);
                                                        PreparedStatement ps = conn.prepareStatement("select name , party from CANDIDATE where CONSTITUENCY = ? and VOTES>=all(select votes from CANDIDATE where CONSTITUENCY = ?)");
                                                        ps.setString(1, cons);
                                                        ps.setString(2, cons);
                                                        rset2 = ps.executeQuery();
                                                        winner = "N/A";
                                                        party = "N/A";
                                                        if (rset2.next()) {
                                                            winner = rset2.getString(1);
                                                            party = rset2.getString(2);
                                                        }
                                        %>
                                <tr><td><%=state%></td><td><%=cons%></td><td><%=party%></td><td><%=winner%></td><td><input type="checkbox" name="save" value="<%=i%>"></td></tr>
                                        <%
                                                    }
                                                }
                                            } catch (Exception e) {
                                                out.println("Result not saved : " + e);
                                            }
                                        %>
                                <tr><td colspan="6"><input type="submit" value="Save Result"/></td></tr>
                            </table>
                        </form></center>
                </div>
            </div>
            <div id="ft"></div>
        </div>
    </body>
</html>
