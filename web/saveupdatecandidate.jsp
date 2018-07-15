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
                                <li><a href="officer2.jsp">Home</a></li><br>
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
                            <%@include file="driver.jsp" %>
                            <%!String epic, adhar, name, consti, state, party, consti1, party1, logo, message;%>
                            <%
                                try {
                                    message = "";
                                    consti1 = (String) session.getAttribute("consti");
                                    party1 = (String) session.getAttribute("party");
                                    name = request.getParameter("Name");
                                    consti = request.getParameter("Constituency");
                                    state = request.getParameter("State");
                                    party = request.getParameter("Party");
                                    adhar = request.getParameter("Adhar");
                                    epic = request.getParameter("Epic");
                                    int votes = Integer.parseInt(session.getAttribute("votes")+"");
                                    
                                    Statement stmt = conn.createStatement();
                                    stmt.executeUpdate("delete from candidate where constituency = '" + consti1 + "' and party = '" + party1 + "'");
                                    ResultSet rslt = stmt.executeQuery("select Logo from party where name = '" + party + "'");
                                    if (rslt.next()) {
                                        logo = rslt.getString(1);
                                    }
                                    stmt.executeUpdate("insert into candidate values('" + name + "','" + party + "','" + state + "','" + consti + "','" + logo + "','" + adhar + "','" + epic + "',"+ votes +")");
                                    message = message + "Updated Successfully";
                                    out.println("<center><h4>" + message + "</center></h4>");
                                } catch (Exception e) {
                                    out.println("Update not Saved : " + e);
                                }
                            %>
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
