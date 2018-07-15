<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%    if (((session.getAttribute("adhar")) == null) || ((session.getAttribute("Biometric")) == null)) {
        response.sendRedirect("invalid.jsp");
    }
    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
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
                        </div>                    </div>
                    <div id="lw22" style="height: 700px">
                        <div id="lw22left" style="height: 700px">
                            <%! int f = 0, h = 0;%>
                            <%! String adhar, tele, email, bio, name, poll, mob, lname, state, constituency, relig, sex, fath_name, moth_name, husb_name, hno, mohl, thana, pin, post, vill, status, x = "", rs = "", message, epic = "";%>
                            <%!String dob;%>  
                            <%@include file="driver.jsp" %>
                            <%

                                adhar = request.getParameter("adhar");
                                name = request.getParameter("name");
                                email = request.getParameter("emailid");
                                tele = request.getParameter("tele");
                                mob = request.getParameter("mobile");
                                hno = request.getParameter("hno");
                                mohl = request.getParameter("area");
                                thana = request.getParameter("thana");
                                pin = request.getParameter("pin");
                                vill = request.getParameter("vill");
                                post = request.getParameter("po");
                                poll = request.getParameter("poll");
                                constituency = request.getParameter("consti");
                                state = request.getParameter("states");
                                fath_name = request.getParameter("fathername");
                                moth_name = request.getParameter("mothername");
                                husb_name = request.getParameter("husbandname");
                                relig = request.getParameter("religion");
                                sex = request.getParameter("sex");
                                dob = request.getParameter("dob");
                                bio = request.getParameter("bio");
                                String dd, mm, yyyy;
                                yyyy = dob.substring(0, 4);
                                mm = dob.substring(5, 7);
                                dd = dob.substring(8, 10);
                                dob = dd + "-" + mm + "-" + yyyy;
                                Statement stmt;
                                ResultSet rset, rset1;
                                try {
                                    stmt = conn.createStatement();
                                    rset = stmt.executeQuery("select max(epic) from voter");
                                    if (rset.next()) {
                                        epic = (rset.getString(1)).substring(3);
                                        int y = Integer.parseInt(epic);
                                        y = y + 1;
                                        epic = "DQB" + y;
                            %>
                            <script>
                                alert("Your Epic no. is <%=epic%>");
                            </script>
                            <%
                                }

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
                                    ResultSet rset2 = stmt.executeQuery("select Adhar from voter where Adhar = '" + adhar + "'");
                                    if (rset2.next()) {
                                        message = "This Adhar no. is already registered";
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
                                        message = "Adhar no. registered successfully";
                                    }
                                }
                            } catch (Exception x) {
                                out.println("Record not Added:" + x);
                            } finally {
                            %>
                            <center> 
                                <h3>Upload Image:</h3>
                                <form enctype="multipart/form-data" method="post" action="upload">
                                    Email : <input type="email" name="email" required>
                                    Please Select the file : <input type="file" name="file" required>
                                    <input type="submit">
                                </form>

                            </center>
                            <%
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
