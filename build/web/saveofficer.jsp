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
                                <li><a href="admin.jsp">Home</a></li><br>
                                <li><a href="">Manage Officer</a>
                                    <ul style="background-color: #cccccc;margin-left: 45px;">
                                        <li><a href="addofficer.jsp">Add Officer</a></li><br>
                                        <li><a href="deleteofficer.jsp">Delete Officer</a></li><br>
                                        <li><a href="updateofficer.jsp">Update Officer</a></li><br>
                                    </ul>
                                </li><br>
                                <li><a href="votepercent.jsp">Set Voting Percentage</a></li><br>
                                <li><a href="chgstatus.jsp">Change Status of Voters</a></li><br>
                                <li><a href="viewfeed.jsp">View Feedback</a></li><br>
                                <li><a href="viewquery.jsp">View Query</a></li><br>
                            </ul>
                        </div>
                    </div>
                    <div id="lw22" style="height: 700px">
                        <div id="lw22left" style="height: 700px">
                            <%! int f = 0, h = 0;%>
                            <%! String party, name, state,biometric, phone, pos,constituency, adhar, epic, logo = "", x = "", rs = "", message = "";%>
                            <%@include file="driver.jsp" %>
                            <%
                                message = "";
                                
                                name = request.getParameter("name");
                                biometric = request.getParameter("biometric");
                                adhar = request.getParameter("adhar");
                                epic = request.getParameter("epic");
                                phone = request.getParameter("phone");
                                pos = request.getParameter("pos");
                                Statement stmt;
                                ResultSet rset, rset1;
                                try {
                                    stmt = conn.createStatement();
                                    rset1 = stmt.executeQuery("select * from voter where adhar = '" + adhar + "' and epic = '" + epic + "'");
                                    if (rset1.next()) {
                                        ResultSet rset2 = stmt.executeQuery("select name from candidate where epic = '" + epic + "' and adhar = '" + adhar + "'");
                                        if (rset2.next()) {
                                            message = message + "The Officer " + rset2.getString(1) + " already exist in the database."
                                                    + "You must update the Data.";
                                        } else {
                                            stmt.executeUpdate("insert into officer values('" + adhar + "','" + phone
                                                    + "','" + biometric + "','" + pos + "','" + epic + "','" + name + "')");
                                            conn.close();
                                            message = message + "Officer registered successfully.";
                                        }
                                    } else {
                                        message = message + "The Epic and Adhar does not belong to the same person.";
                                    }
                                } catch (Exception x) {
                                    out.println("Record not Added:" + x);
                                } finally {
                            %>
                            <center> <h4><%out.println(message + "\n");
                                }
                                    %>
                                </h4></center>
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
