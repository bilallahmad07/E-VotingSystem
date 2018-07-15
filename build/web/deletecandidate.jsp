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
        <script type="text/javascript" src="Aj_consti.js"></script>
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
                            <form action="delcandidate.jsp" method="post">
                                <table align="center" id="table1" border="1" style="height: 200px">
                                    <tr><th colspan="2">Delete the Candidate</th></tr>
                                    <tr>
                                        <td class="align">Select state</td>
                                        <td class="align">
                                            <select class="align" value="" onblur="funp()" name="states" id="states" required>
                                                <option value="" selected="selected">---select---</option>

                                                <%@include file="driver.jsp" %> 
                                                <%
                                                    Statement stmt;
                                                    ResultSet rset;
                                                    try {
                                                        stmt = conn.createStatement();
                                                        rset = stmt.executeQuery("select distinct state from state");
                                                        while (rset.next()) {
                                                %>
                                                <option name="<%= rset.getString("state")%>" value="<%= rset.getString("state")%>"><%= rset.getString("state")%></option>
                                                <%
                                                    }
                                                %>  
                                            </select>*
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="align">Constituency:</td>
                                        <td class="align">
                                            <select name="consti" value="" id="consti" required>
                                                <option value="" selected="selected">---select state first---</option>

                                            </select>*    
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Select the Party:</td>
                                        <td>
                                            <select name="party" value="" id="party" required>
                                                <option value="" selected="selected">---select---</option>
                                                <%
                                                    rset = stmt.executeQuery("select name from party");
                                                    while (rset.next()) {
                                                %>
                                                <option name="<%= rset.getString(1)%>" value="<%= rset.getString(1)%>"><%= rset.getString(1)%></option>
                                                <%
                                                        }
                                                    } catch (Exception e) {
                                                        out.println("Candidate not deleted : " + e);
                                                    }
                                                %>
                                            </select>*
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><input type="submit"></td>
                                        <td><input type="reset" onclick="return res()"</td>
                                    </tr>
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
