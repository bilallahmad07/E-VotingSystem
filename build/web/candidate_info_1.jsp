<%    if (((session.getAttribute("adhar")) == null) || ((session.getAttribute("Biometric")) == null)) {
        response.sendRedirect("invalid.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Election Candidates</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <script type="text/javascript" src="disable.js"></script>
        <link rel="stylesheet" type="text/css" href="newcss.css"/>
    </head>
    <body>
        <div id="wr">
            <%@include file="header2.jsp" %>
            <div id="lw" style="height: 900px">
                <%@include file="lw1.jsp" %>
                <div id="lw2" style="height: 700px">
                    <div id="lw21">
                        <div style="height: 100px; width: 95%; background-color: #ffff99">
                            <center><span style="font-size: 20px; font-weight: 900;">Welcome<br><%=session.getAttribute("adhar") + ""%><br></span>
                                <a href="logout.jsp"><input type="button" value="logout"/></a></center>
                        </div>
                        <table id="tble1" style="width: 95%; height: 490px; margin-top: 5px; background-color: #ffcccc; text-align: center;">
                            <tr class="tr1"><td><a href="voter.jsp">Home</a></td></tr>
                            <tr class="tr1"><td><a href="castvote.jsp">Cast Vote</a></td></tr>
                            <tr class="tr1"><td><a href="candidate_1.jsp">Candidates</a></td></tr>
                            <tr class="tr1"><td><a href="date_1.jsp">Election Dates</a></td></tr>
                            <tr class="tr1"><td><a href="showresult.jsp">Current Election Result</a></td></tr>
                            <tr class="tr1"><td><a href="http://eci.nic.in">Visit ECI</a></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                        </table>
                    </div>
                    <div id="lw22" style="height: 700px">
                        <div id="lw22left" style="height: 700px">
                            <center>
                                <span class="blink_text">
                                    <a href="http://eci.nic.in/eci_main1/current/nvsp.mp4" target="_blank">
                                        <font style="letter-spacing:-1px" color="#155aa0" size="5">Know more about National Voters' Service Portal</font>
                                    </a>
                                </span>
                            </center><br><br>
                            <%@include file="driver.jsp" %>
                            <%!String state, cons, party;%>
                            <%
                                state = request.getParameter("states");
                                cons = request.getParameter("consti");
                            %>
                            <center><h3>Candidates of <%=cons%></h3></center>
                            <table id="table1" border="1">
                                <tr>
                                    <th><u>sl. no.</u></th><th><u>Symbol</u></th><th><u>Name</u></th><th><u>Party</u></th><th><u>State</u></th><th><u>Constituency</u></th>
                                </tr>
                                <%
                                    int i = 1;
                                    try {
                                        Statement stmt = conn.createStatement();
                                        ResultSet rset = stmt.executeQuery("select * from candidate where state = '" + state + "' and constituency = '" + cons + "'");
                                        while (rset.next()) {
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><img src="images/<%=rset.getString("Logo")%>" ></td>
                                    <td><%= rset.getString("name")%></td>
                                    <td><%= rset.getString("party")%></td>
                                    <td><%= rset.getString("state")%></td>
                                    <td><%= rset.getString("constituency")%></td>
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
                        <div id="lw22right" style="height: 600px">
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
