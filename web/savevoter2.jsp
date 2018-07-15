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
                        <div id="lw22left" style="height: 700px">
                            <form action="savevoter.jsp" method="post">
                                <table align="center" id="table1" border="1">
                                    <th colspan="2">Enter the Details of voter</th>
                                    <tr>
                                        <td>Adhar:</td><td><input type="text" name="adhar" value="" id="adhar" required>*</td>
                                    </tr>
                                    <tr>
                                        <td>Name:</td><td><input type="text" name="name" value="" id="name" required>*</td>
                                    </tr>
                                    <tr>
                                        <td>Email Id:</td><td><input type="email" name="emailid" value="" id="emailid" required>*</td>
                                    </tr>
                                    <tr>
                                        <td>TelePhone:</td><td><input type="tel" name="tele" value="" id="tele"></td>
                                    </tr>
                                    <tr>
                                        <td>Mobile Number:</td><td><input type="tel" name="mobile" value="" id="mobile" required>*</td>
                                    </tr>
                                    <tr>
                                        <td>House no.:</td><td><input type="text" name="hno" id="hno" required />*</td>
                                    </tr>
                                    <tr>
                                        <td>Area/Mohalla:</td><td><input type="text" name="area" id="area" required />*</td>
                                    </tr>
                                    <tr>
                                        <td>Tahseel/Thana:</td><td><input type="text" name="thana" id="thana" required />*</td>
                                    </tr>
                                    <tr>
                                        <td>Post Office:</td><td><input type="text" name="po" id="po" required />*</td>
                                    </tr>
                                    <tr>
                                        <td>Town/Village:</td><td><input type="text" name="vill" id="vill" required />*</td>
                                    </tr>
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
                                                    } catch (Exception e) {
                                                        out.println("Error : " + e);
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
                                        <td>Pincode:</td><td><input type="text" name="pin" id="pin" required />*</td>
                                    </tr>
                                    <tr>
                                        <td>Polling Booth:</td><td><input type="text" name="poll" id="poll" required />*</td>
                                    </tr>
                                    <tr>
                                        <td>Father's Name:</td><td><input type="text" name="fathername" id="fathername" required />*</td>
                                    </tr>
                                    <tr>
                                        <td>Mother's Name:</td><td><input type="text" name="mothername" id="mothername" required />*</td>
                                    </tr>
                                    <tr>
                                        <td>Husband's Name:</td><td><input type="text" name="husbandname" id="husbandname"/></td>
                                    </tr>
                                    <tr>
                                        <td>Religion:</td><td><input type="text" name="religion" value="" id="religion" required>*</td>
                                    </tr>
                                    <tr>
                                        <td>Sex:</td>
                                        <td>
                                            <select name="sex" value="" id="sex" required>
                                                <option value="" selected="selected">---select---</option>
                                                <option name="male" value="male">Male</option>
                                                <option name="female" value="female">female</option>
                                            </select>*   
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Date of Birth:</td><td><input type="date" name="dob" id="dob" required />*</td>
                                    </tr>
                                    <tr>
                                        <td>Password:</td><td><input name="bio" value="" id="biometric" required>*</td>
                                    </tr>
                                    <tr><td><input type="submit" value="submit" onClick="return checkvoterentry()"></td>
                                        <td><input type="reset" value="reset" onClick="return res()"></td>
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
