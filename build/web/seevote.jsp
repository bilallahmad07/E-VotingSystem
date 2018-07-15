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
        <title>Election Candidates</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <script type="text/javascript" src="disable.js"></script>

    </head>
    <body>
        <div id="wr">
            <%@include file="header2.jsp" %>
            <div id="lw" style="height: 900px">
                <%@include file="lw1.jsp" %>
                <div id="lw2" style="height: 700px">
                    <div id="lw21">
                        <div style="height: 100px; width: 95%; background-color: #ffff99">
                            <center><span style="font-size: 20px; font-weight: 900;">Welcome<br><%=session.getAttribute("type")%><br></span>
                                <a href="logout.jsp"><input type="button" value="logout"/></a></center>
                        </div>
                        <table id="tble1" style="width: 95%; height: 590px; margin-top: 5px; background-color: #ffcccc; text-align: center;">
                            <tr class="tr1"><td><a href="<%= type%>" >Home</a></td></tr>
                            <tr class="tr1"><td><a href="http://eci.nic.in">Visit ECI</a></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                        </table>
                    </div>
                    <div id="lw22" style="height: 700px">
                        <div id="lw22left" style="height: 700px">
                            <br><br>
                            <%@include file="driver.jsp" %>
                            <%!String state, cons, party;%>
                            <%
                                state = request.getParameter("states");
                                cons = request.getParameter("consti");
                                session.setAttribute("state", state);
                                session.setAttribute("constituency",cons);
                            %>
                            <center><h3>Select the Candidate who won from <%=cons%></h3></center>
                            <form action="setwinner.jsp" method="post">
                                <table id="table1" style="margin-left: 5px" border="1">
                                    <tr>
                                        <th><u>sl. no.</u></th><th><u>Symbol</u></th><th><u>Name</u></th><th><u>Party</u></th><th><u>State</u></th><th><u>Constituency</u></th><th><u>No. of Votes</u></th><th><u>Select</u></th>
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
                                        <td><%=rset.getString("votes")%></td>
                                        <td><input type="radio" name="option" value="<%= rset.getString("party")%>" id="option"></td>
                                    </tr>
                                    <%
                                            i = i + 1;
                                        }
                                    %>
                                    <tr>
                                        <td colspan="4"><input type="submit" value="submit" onclick="return chk_input()"></td>
                                        <td colspan="4"><input type="reset" value="reset" onclick="return prreset()"</td>
                                    </tr>
                                    <%
                                        } catch (Exception e) {
                                            out.println(e);
                                        }

                                    %>
                                </table>
                            </form>
                        </div>
                        <div id="lw22right" style="height: 700px">
                            <div id="up" style="height: 270px">
                                <br><br>
                                <a href="http://eci.nic.in/eci_main1/ecz.aspx" style="color: black; text-decoration: none; font-size: 16px;">
                                    <img src="images/cec_nz.jpg" style="margin-left: 25%; width: 50%; margin-top: 10px; border: 2px solid #666666;"/>
                                    <br>
                                    <center>Dr. Nasim Zaidi<br>Cheif  Election Commisioner</center></a>
                            </div>
                            <div id="middle" style="height: 415px">
                                <table style="text-align: center; width: 100%; height: 98%; margin-top: 5px; ">
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/tm.aspx">Training Material</a></td></tr>
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/electoral_law.aspx">Election Laws & instructions</a></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
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
