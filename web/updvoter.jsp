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
                                <li><a href="officer1.jsp">Home</a></li><br>
                                <li><a href="">&nbsp;&nbsp;&nbsp;Manage Voters&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                    <ul style="background-color: #cccccc;">
                                        <li><a href="addvoter.jsp">Add Voter</a></li><br>
                                        <li><a href="deletevoter.jsp">Delete Voter</a></li><br>
                                        <li><a href="updatevoter.jsp">Update Voter</a></li><br>
                                    </ul>
                                </li><br>
                                <li><a target="_blank" href="setresult.jsp?value=1">Set Election Result</a></li><br>
                                <li><a target="_blank" href="http://eci.nic.in">Visit ECI</a></li><br>
                            </ul>
                        </div>
                    </div>
                    <div id="lw22" style="height: 700px">
                        <div id="lw22left" style="height: 700px;">
                            <br><br>
                            <form action="saveupdatevoter.jsp" method="post">

                                <%! int f = 0;%>
                                <%! String adhar2, type, bio;%>
                                <%@include file = "driver.jsp" %> 
                                <%
                                    adhar2 = request.getParameter("adhar2");
                                    session.setAttribute("adhar2", adhar2);
                                    try {
                                        String msg = "", x = "";
                                        int i = 1;
                                        String left[] = {"", "Adhar", "Name", "Emailid", "Telephone No.", "Mobile No.", "House No.",
                                            "Area", "Thana", "Post Office", "City", "Constituency", "Polling Booth", "State", "Pincode",
                                            "Father's Name", "Mother's Name", "Husband's Name", "Religion", "Sex", "Date of Birth",
                                            "Password", "Epic"};
                                        Statement stmt = conn.createStatement();
                                        ResultSet rset = stmt.executeQuery("select * from voter where adhar = '" + adhar2 + "'");
                                        if (rset.next()) {
                                %>
                                <table id="table1" border="1" style="margin-top: -10px">
                                    <tr><th colspan="2"><center><u>Fill the information which you want to update</u></center></th></tr>
                                    <tr><td><%=left[22]%></td><td><input name="<%=left[22]%>" value="<%=rset.getString("epic")%>"></td></tr>
                                            <%
                                                while (i < 22) {
                                                    x = rset.getString(i);
                                                    if (x == null) {
                                                        x = "N/A";
                                                    }
                                                    if (i != 20) {
                                            %>
                                    <tr><td><%=left[i]%></td><td><input name="<%=left[i]%>" value="<%=x%>"></td></tr>
                                            <%
                                                    }

                                                    i++;
                                                }

                                                java.util.Date date = rset.getDate("dateofbirth");
                                                String d2 = df.format(date);

                                            %>
                                    <tr><td><%=left[20]%></td><td><input name="<%=left[20]%>" value="<%=d2%>"></td></tr>
                                    <tr><td><input type="submit" onclick="return check()"></td><td><input type="reset" onclick="return res()"></td></tr>
                                </table>
                                <%
                                        } else {
                                            out.println("<center><h3>Voter does not exist!</h3></center>");
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
