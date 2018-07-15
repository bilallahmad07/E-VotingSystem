<%!String bio, adh, type, otp;%>
<%  bio = session.getAttribute("Biometric") + "";
    adh = session.getAttribute("adhar") + "";
    type = session.getAttribute("type") + "";
    otp = session.getAttribute("otp") + "";
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LoginPage</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <script type="text/javascript" src="disable.js"></script>
        <script type="text/javascript">
            //alert("OTP:"+<%=otp%>);
            function chkdetail() {
                var a, res1, otp;
                otp = document.getElementById("otp").value;
                a = /\d{5}$/;
                res1 = a.test(otp);
                if (res1 != true)
                {
                    alert("Enter Your OTP Correctly!");
                    return false;
                }
                else
                {
                    return true;
                }
            }

            function prReset() {

                if (confirm("Do you want to reset!"))
                    return true;
                else
                    return false;
            }

        </script>
        <script src="sliderengine/jquery.js"></script>
        <script src="sliderengine/amazingslider.js"></script>
        <link rel="stylesheet" type="text/css" href="sliderengine/amazingslider-1.css">
        <script src="sliderengine/initslider-1.js"></script>
    </head>
    <body>
        <div id="wr">
            <%@include file="header.jsp" %>
            <div id="lw">
                <%@include file="lw1.jsp" %>
                <div id="lw2">
                    <%@include file="lw21.jsp" %>
                    <div id="lw22">
                        <div id="lw22left">
                            <form action="chk_acc2.jsp" method="post">
                                <table id="table1" border="1" style="height: 300px">
                                    <tr><th colspan="2"><u>Enter Your OTP here!</u></th></tr>
                                    <tr>
                                        <td>Type : </td><td><input type="text" disabled="disabled" value="<%= type%>" name="type"/></td>
                                    </tr>
                                    <tr>
                                        <td>Adhar Number : </td><td><input type="text" disabled="disabled" value="<%=adh%>" name="adhar"/></td>
                                    </tr>
                                    <tr>
                                        <td>OTP : </td><td><input type="text" id="otp" name="otp"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><input type="submit" value="submit" onclick="return chkdetail()"/>&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="reset" value="reset" onclick="return prReset()"/></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div id="lw22right" style="margin-top: -27px;">
                            <div id="up" style="height: 270px;"><br><br>
                                <a href="http://eci.nic.in/eci_main1/ecz.aspx" style="color: black; text-decoration: none; font-size: 16px;">
                                    <img src="images/cec_nz.jpg" style="margin-left: 25%; width: 50%; margin-top: 10px; border: 2px solid #666666;"/>
                                    <br>
                                    <center>Dr. Nasim Zaidi<br>Cheif  Election Commisioner</center></a>
                            </div>
                            <div id="middle" style="height: 315px">
                                <table style="text-align: center; width: 100%; height: 98%; margin-top: 5px; ">
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/Linkto_electo_search.aspx">Search your name in voter's list</a></td></tr>
                                    <tr class="tr2"><td><a href="http://psleci.nic.in/">Know your Polling Station</a></td></tr>
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/tm.aspx">Training Material</a></td></tr>
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/electoral_law.aspx">Election Laws & instructions</a></td></tr>
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
            <div id="ft">

            </div>

        </div>

    </body>
</html>
