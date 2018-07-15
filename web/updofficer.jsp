<%@page import="java.text.*" %>
<%!SimpleDateFormat df;%>
<%    df = new SimpleDateFormat("dd/MM/yyyy");
%>
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
                        <div id="lw22left" style="height: 700px;">
                            <br><br>
                            <form action="saveupdateofficer.jsp" method="post">
                                <%! int f = 0;%>
                                <%! String adhar, type, bio;%>
                                <%@include file = "driver.jsp" %> 
                                <%
                                    adhar = request.getParameter("adhar2");
                                    session.setAttribute("adhar2", adhar);
                                    try {
                                        String msg = "", x = "";
                                        int i = 1;
                                        String left[] = {"", "Adhar", "Epic", "Phone", "Position", "Name"};
                                        Statement stmt = conn.createStatement();
                                        ResultSet rset = stmt.executeQuery("select adhar,epic,phone,pos,name from officer where adhar = '" + adhar + "'");
                                        if (rset.next()) {
                                %>
                                <table id="table1" border="1" style="margin-top: -10px">
                                    <tr><th colspan="2"><center><u>Fill the information which you want to update</u></center></th></tr>
                                            <%
                                                while (i < 6) {
                                                    x = rset.getString(i);
                                                    if (x == null) {
                                                        x = "N/A";
                                                    }

                                            %>
                                    <tr><td><b><%=left[i]%></b></td><td><input name="<%=left[i]%>" value="<%=x%>"></td></tr>
                                            <%
                                                    i++;
                                                }
                                            %>
                                    <tr><td colspan="2"><input type="submit" onclick="return check()"></td></tr>
                                </table>
                                <%  } else {
                                            out.println("<center><h3>Officer does not exist!</h3></center>");
                                        }
                                        rset = stmt.executeQuery("select biometric from officer where adhar = '" + adhar + "'");
                                        if (rset.next()) {
                                            session.setAttribute("bio", rset.getString(1));
                                        }
                                    } catch (Exception e) {
                                        out.println("Could not login : " + e);
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
