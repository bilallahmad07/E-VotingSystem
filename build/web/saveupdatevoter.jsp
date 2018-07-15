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
                        <div id="lw22left" style="height: 700px">
                            <br><br>
                            <%! String epic, adhar, tele, email, bio, name, poll, mob, lname, state, constituency, relig, sex, fath_name, moth_name, husb_name, hno, mohl, thana, pin, post, vill, status, x = "", rs = "", message;%>
                            <%!String dob;%>  
                            <%@include file="driver.jsp" %>
                            <%
                                int h = 0;
                                epic = request.getParameter("Epic");
                                adhar = request.getParameter("Adhar");
                                name = request.getParameter("Name");
                                email = request.getParameter("Emailid");
                                tele = request.getParameter("Telephone No.");
                                mob = request.getParameter("Mobile No.");
                                hno = request.getParameter("House No.");
                                mohl = request.getParameter("Area");
                                thana = request.getParameter("Thana");
                                post = request.getParameter("Post Office");
                                vill = request.getParameter("City");
                                constituency = request.getParameter("Constituency");
                                poll = request.getParameter("Polling Booth");
                                state = request.getParameter("State");
                                pin = request.getParameter("Pincode");
                                fath_name = request.getParameter("Father's Name");
                                moth_name = request.getParameter("Mother's Name");
                                husb_name = request.getParameter("Husband's Name");
                                relig = request.getParameter("Religion");
                                sex = request.getParameter("Sex");
                                dob = request.getParameter("Date of Birth");
                                bio = request.getParameter("Biometric");

                                Statement stmt;
                                ResultSet rset, rset1;
                                try {
                                    stmt = conn.createStatement();
                                    String adhar2 = (String) session.getAttribute("adhar2");
                                    stmt.executeUpdate("delete from voter where adhar = '" + adhar2 + "'");
                                    rset1 = stmt.executeQuery("select * from state where constituency = '" + constituency + "'");
                                    while (rset1.next()) {
                                        rs = rset1.getString("state");
                                        if (rs.equals(state)) {
                                            h = 1;
                                        }
                                    }
                                    if (h != 1) {
                                        message = "The Constituency does not belongs to the selected state";
                                    } else {
                                        stmt.executeUpdate("insert into voter (adhar,name,emailid,telephone,mobile_number,"
                                                + "house_number,area,thana,post_office,city,constituency,polling_booth,state,"
                                                + "pincode,father_name,mother_name,husband_name,religion,sex,dateofbirth,"
                                                + "Biometric,status,epic)"
                                                + "values('" + adhar + "','" + name + "','" + email + "','" + tele + "','" + mob + "','" + hno + "','"
                                                + mohl + "','" + thana + "','" + post + "','" + vill + "','" + constituency + "','" + poll + "','"
                                                + state + "','" + pin + "','" + fath_name + "','" + moth_name + "','" + husb_name + "','" + relig + "','"
                                                + sex + "','" + dob + "','" + bio + "','0','" + epic + "')");
                                        conn.close();
                                        message = "Adhar no. updated successfully";

                                    }
                                } catch (Exception x) {
                                    out.println("Record not Added:" + x);
                                } finally {
                            %>
                            <center> <h3><%out.println(message + "\n");
                                }
                                    %>
                                </h3></center>
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
