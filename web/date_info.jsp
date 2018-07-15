<%@page import="java.text.*" %>
<%!SimpleDateFormat df;%>
<%    df = new SimpleDateFormat("dd/MM/yyyy");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Election Dates</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <script type="text/javascript" src="disable.js"></script>

    </head>
    <body>
        <div id="wr">
            <%@include file="header.jsp" %>
            <div id="lw">
                <%@include file="lw1.jsp" %>
                <div id="lw2">
                    <%@include file="lw21.jsp" %>
                    <div id="lw22">
                        <div id="lw22left">

                            <%@include file="driver.jsp" %>
                            <%!String state, cons;%>
                            <%
                                state = request.getParameter("states");
                                cons = request.getParameter("consti");
                            %>
                            <center><h3>Voting Date of <%=cons%></h3></center>
                            <table id="table1" style="height: 100px;" border="1">
                                <tr>
                                    <th><u>sl. no.</u></th><th><u>State</u></th><th><u>Constituency</u></th><th><u>Date</u></th>
                                </tr>
                                <%
                                    int i = 1;
                                    try {
                                        Statement stmt = conn.createStatement();
                                        ResultSet rset = stmt.executeQuery("select * from state where state = '" + state + "' and constituency = '" + cons + "'");
                                        while (rset.next()) {
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%= rset.getString("state")%></td>
                                    <td><%= rset.getString("constituency")%></td>
                                    <%
                                        java.util.Date date = rset.getDate("votingdate");
                                        String d2 = df.format(date);
                                    %>
                                    <td><%=d2%></td>
                                </tr>
                                <%
                                            i = i + 1;
                                        }
                                    } catch (Exception e) {
                                        out.println(e);
                                    }

                                %>
                            </table>

                        </div>
                        <div id="lw22right" style="height: 600px;  margin-top: -27px;">
                            <div id="up" style="height: 270px">
                                <br><br>
                                <a href="http://eci.nic.in/eci_main1/ecz.aspx" style="color: black; text-decoration: none; font-size: 16px;">
                                    <img src="images/cec_nz.jpg" style="margin-left: 25%; width: 50%; margin-top: 10px; border: 2px solid #666666;"/>
                                    <br>
                                    <center>Dr. Nasim Zaidi<br>Cheif  Election Commisioner</center></a>
                            </div>
                            <div id="middle" style="height: 315px">
                                <table style="text-align: center; width: 100%; height: 98%; margin-top: 5px; ">
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/Linkto_electo_search.aspx">Search your name in voter's list</a></td></tr>
                                    <tr class="tr2"><td><a href="http://psleci.nic.in/">Know your Polling Station</a></td></tr>
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
