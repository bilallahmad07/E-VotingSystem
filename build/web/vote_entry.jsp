<%@page import="java.text.SimpleDateFormat"%>
<%    if (((session.getAttribute("adhar")) == null) || ((session.getAttribute("Biometric")) == null)) {
        response.sendRedirect("invalid.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <script type="text/javascript" src="disable.js"></script>
    </head>
    <body>
        <div id="wr" style="height: 1100px">
            <%@include file="header2.jsp" %>
            <div id="lw">
                <%@include file="lw1.jsp" %>
                <div id="lw2">
                    <%@include file="lw21voter.jsp" %>
                    <div id="lw22">
                        <div id="lw22left">
                            <%@include file="driver.jsp" %>
                            <%!String option, state = "", cons = "", adhar, status, epic, name, candidate;%>
                            <%
                                status = session.getAttribute("status").toString();
                                if (status.equals("0")) {
                                    option = request.getParameter("option");
                                    adhar = session.getAttribute("adhar") + "";
                                    epic = session.getAttribute("epic").toString();
                                    int v = 0;
                                    try {
                                        Statement stmt = conn.createStatement();
                                        ResultSet rset = stmt.executeQuery("select * from voter where Adhar = '" + adhar + "'");
                                        if (rset.next()) {
                                            state = rset.getString("State");
                                            cons = rset.getString("Constituency");
                                            name = rset.getString("name");
                                        }
                                        stmt.executeUpdate("update voter set selectedparty = '" + option + "'" + " where Adhar = '" + adhar + "'");
                                        ResultSet rslt = stmt.executeQuery("select * from candidate where state = '" + state + "' and constituency = '" + cons + "' and party = '" + option + "'");
                                        if (rslt.next()) {
                                            candidate = rslt.getString("name");
                                            v = Integer.parseInt(rslt.getString("votes"));
                                        }
                                        v = v + 1;
                                        String vote = v + "";
                                        stmt.executeUpdate("update candidate set votes = '" + vote + "' where state = '" + state + "' and constituency = '" + cons + "' and party = '" + option + "'");
                                        stmt.executeUpdate("update voter set status = '1' where Adhar = '" + adhar + "'");
                                        stmt.executeUpdate("delete from castedvotes where Adhar = '" + adhar + "'");
                                        PreparedStatement ps = conn.prepareStatement("insert into castedvotes values(?,?,?,?,?,?,?)");
                                        ps.setString(1, adhar);
                                        ps.setString(2, epic);
                                        ps.setString(3, name);
                                        ps.setString(4, cons);
                                        ps.setString(5, state);
                                        ps.setString(6, option);
                                        ps.setString(7, candidate);
                                        ps.executeUpdate();
                                        session.setAttribute("status", "1");
                                        out.println("<h2><center>Your Vote has been casted</center></h2>");
                                    } catch (Exception e) {
                                        out.println("vote not saved:" + e);
                                    }
                                } else {
                                    response.sendRedirect("invalid.jsp");
                                }
                            %>
                            <br>
                            <%@include file="slider.jsp" %>

                        </div>
                        <div id="lw22right">
                            <div id="up" style="height: 270px">
                                <br><br>
                                <a href="http://eci.nic.in/eci_main1/ecz.aspx" style="color: black; text-decoration: none; font-size: 16px;">
                                    <img src="images/cec_nz.jpg" style="margin-left: 25%; width: 50%; margin-top: 10px; border: 2px solid #666666;"/>
                                    <br>
                                    <center>Dr. Nasim Zaidi<br>Cheif  Election Commisioner</center></a>
                            </div>
                            <div id="middle" style="height: 315px">
                                <table style="text-align: center; width: 100%; height: 98%; margin-top: 5px; ">
                                    <tr class="tr2"><td><a href="search_name.jsp">Search your name in voter's list</a></td></tr>
                                    <tr class="tr2"><td><a href="know_polling.jsp">Know your Polling Station</a></td></tr>
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/tm.aspx">Training Material</a></td></tr>
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/electoral_law.aspx">Election Laws & instructions</a></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="ft"></div>
        </div>
    </body>
</html>
