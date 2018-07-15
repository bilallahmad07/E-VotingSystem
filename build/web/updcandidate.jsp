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
            <div id="lw" style="height: 900px">
                <%@include file="lw1.jsp" %>
                <div id="lw2" style="height: 700px">
                    <div id="lw21">
                        <div style="height: 100px; width: 95%; background-color: #ffff99">
                            <center><span style="font-size: 20px; font-weight: 900;">Welcome<br><%=session.getAttribute("type")%><br></span>
                                <a href="logout.jsp"><input type="button" value="logout"/></a></center>
                        </div>
                        <div id="menu" style="background-color: #ffcccc; height: 590px;width: 95%;">
                            <ul>
                                <li><a href="officer1.jsp">Home</a></li><br>
                                <li><a href="">Manage Candidates</a>
                                    <ul style="background-color: #cccccc;">
                                        <li><a href="addcandidate.jsp">Add Candidate</a></li><br>
                                        <li><a href="deletecandidate.jsp">Delete Candidate</a></li><br>
                                        <li><a href="updatecandidate.jsp">Update Candidate</a></li><br>
                                    </ul>
                                </li><br>
                                <li><a href="setresdate.jsp">Set Result Date</a></li><br>
                                <li><a href="http://eci.nic.in">Visit ECI</a></li><br>
                                <li></li><br>
                            </ul>
                        </div>
                    </div>
                    <div id="lw22" style="height: 700px">
                        <div id="lw22left" style="height: 700px">
                            <br><br>
                            <form action="saveupdatecandidate.jsp" method="post">

                                <%! int f = 0;%>
                                <%! String state, consti, party, bio, x = "";%>
                                <%@include file = "driver.jsp" %> 
                                <%
                                    state = request.getParameter("states");
                                    consti = request.getParameter("consti");
                                    party = request.getParameter("party");
                                    String left[] = {"", "Name", "Party", "State", "Constituency", "Adhar", "Epic"};
                                    session.setAttribute("party", party);
                                    session.setAttribute("consti", consti);
                                    try {
                                        Statement stmt;
                                        ResultSet rset;
                                        int i = 1;
                                        stmt = conn.createStatement();
                                        rset = stmt.executeQuery("select * from candidate where state='" + state + "' and constituency='" + consti + "' and party='" + party + "'");
                                        if (rset.next()) {
                                %>
                                <table id="table1" border="1" style="height: 300px">
                                    <tr><th colspan="2"><center><u>Fill the information which you want to update</u></center></th></tr>
                                            <%
                                                while (i <= 6) {
                                                    if (i > 4) {
                                                        x = rset.getString(i + 1);
                                                    } else {
                                                        x = rset.getString(i);

                                                    }
                                                    if (x == null) {
                                                        x = "N/A";
                                                    }
                                            %>
                                    <tr><td><b><%=left[i]%></b></td><td><input name="<%=left[i]%>" value="<%=x%>"></td></tr>
                                            <%
                                                    i++;
                                                }
                                                session.setAttribute("votes", rset.getString("votes"));
                                            %>
                                    <tr><td><input type="submit" onclick="return check()"></td><td><input type="reset" onclick="return res()"></td></tr>
                                </table>
                                <%
                                        }
                                        else {
                                            out.println("<center><h3>Candidate does not exist!</h3></center>");
                                        }
                                    } catch (Exception e) {
                                        out.println("Could not update : " + e);
                                    }
                                %>
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
