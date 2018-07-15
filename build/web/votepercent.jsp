<%@page import="in.gov.uidai.qssitv.model.FingerprintQualityAttribute"%>
<%@page import="in.gov.uidai.qssitv.model.FingerprintQSS"%>
<%@page import="com.sun.prism.impl.BaseMesh.FaceMembers"%>
<%@page import="in.gov.uidai.qssitv.model.FaceQualityAttribute"%>
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
        <script type="text/javascript" src="disable.js"></script>
         <link rel="stylesheet" type="text/css" href="menu.css"/>
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
                            <%!String cons, winner, party;%>
                            <%!int voters, votes;%>
                            <%@include file = "driver.jsp" %> 
                            <%    try {
                                    PreparedStatement ps1 = conn.prepareStatement("select constituency from state");
                                    ResultSet rs = ps1.executeQuery();
                                    while (rs.next()) {
                                        votes = 0;
                                        cons = rs.getString(1);
                                        FingerprintQualityAttribute f = 
                                        
                                        PreparedStatement ps = conn.prepareStatement("select count(adhar) from voter where constituency = ?");
                                        ps.setString(1, cons);
                                        ResultSet rset = ps.executeQuery();
                                        if (rset.next()) {
                                            voters = rset.getInt(1);
                                            ps = conn.prepareStatement("select count(adhar) from castedvotes where constituency = ?");
                                            ps.setString(1, cons);
                                            ResultSet rset2 = ps.executeQuery();
                                            if (rset2.next()) {
                                                votes = rset2.getInt(1);
                                            }
                                            Double percent = (double) (100 * votes) / voters;
                                            String percentage = percent+"";
                                            if(percentage.length()>5){
                                               percentage = percentage.substring(0,6);
                                            }
                                            Statement stmt = conn.createStatement();
                                            stmt.executeUpdate("update state set vote_percent = '" + percentage + "' where constituency = '" + cons + "' ");
                                        }
                                    }
                                    out.println("<br><br><center><h3>Vote Percent Calculated and Saved</h3></center>");
                                } catch (Exception e) {
                                    out.println("Vote Percentage not saved : " + e);
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

