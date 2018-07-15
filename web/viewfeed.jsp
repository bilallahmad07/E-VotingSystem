<%    if (((session.getAttribute("adhar")) == null) || ((session.getAttribute("Biometric")) == null) || ((session.getAttribute("type")) != "admin.jsp")) {
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
        <link rel="stylesheet" type="text/css" href="menu.css"/>
        <script type="text/javascript" src="disable.js"></script>

    </head>
    <body>
        <div id="wr" style="height: 1100px">
            <%@include file="header2.jsp" %>
            <div id="lw" style="height: 900px">
                <%@include file="lw1.jsp" %>
                <div id="lw2" style="height: 700px">
                    <div id="lw21">
                        <div style="height: 100px; width: 95%; background-color: #ffff99">
                            <center><span style="font-size: 20px; font-weight: 900;">Welcome<br>Admin<br></span>
                                <a href="logout.jsp"><input type="button" value="logout"/></a></center>
                        </div>
                        <!--
                        <table id="tble1" style="width: 95%; height: 590px; margin-top: 5px; background-color: #ffcccc; text-align: center;">
                            <tr class="tr1"><td><a href="admin.jsp">Home</a></td></tr>
                            <tr class="tr1"><td><a href="">Manage Officer</a></td></tr>
                            <tr class="tr1"><td><a href="votepercent.jsp">Vote Percentage</a></td></tr>
                            <tr class="tr1"><td><a href="chgstatus.jsp">Change Status of Voters</a></td></tr>
                            <tr class="tr1"><td><a href="http://eci.nic.in">Visit ECI</a></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                        </table>-->
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
                        <div id="lw22left">
                            <br>
                            <%
                                if (request.getParameter("msg") != null) {
                                    out.println("<center><h4>Feedback deleted</h4></center>");
                                }
                            %>
                            <center><h3>Feedbacks</h3></center>
                            <table id="table1" border="1">
                                <tr><th>ID</th><th>Adhar</th><th>Feedback</th><th>Action</th></tr>
                                        <%@include file="driver.jsp" %>
                                        <%
                                            Statement stmt = conn.createStatement();
                                            ResultSet rs = stmt.executeQuery("select * from feedback");
                                            while (rs.next()) {
                                                String adhar = rs.getString(1);
                                                String feedback = rs.getString(2);
                                                int fid = rs.getInt(3);
                                        %>
                                <tr><td><%=fid%></td><td><%=adhar%></td><td><%=feedback%></td><td><a href="delfeed.jsp?fid=<%=fid%>">Delete</a></td></tr>
                                <%
                                    }
                                %>
                            </table>
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
