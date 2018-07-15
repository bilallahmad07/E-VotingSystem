<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <script type="text/javascript" src="disable.js"></script>

    </head>
    <body>
        <div id="wr" style="height: 1100px">
            <%@include file="header.jsp" %>
            <div id="lw">
                <%@include file="lw1.jsp" %>
                <div id="lw2">
                    <br><br><br><br><br><br><br><br><br><br>
                    <%
                        int st = Integer.parseInt(request.getParameter("cid").toString());
                        int x = 24;
                        int lt = st + x;
                    %>
                    <table id="table1" border="1" style="width: 70%; margin-left: 15%;">
                        <tr><th>Id</th><th>Constituency</th><th>State</th><th>Vote Percentage(%)</th></tr>
                                <%
                                    Class.forName("oracle.jdbc.OracleDriver");
                                    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bilal", "bil1212210039");
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery("select cid,constituency,state,vote_percent from state order by cid");
                                    int i = 1;
                                    while (rs.next()) {
                                        if ((rs.getInt(1) >= st) && (rs.getInt(1) < lt)) {
                                            String vp = rs.getString(4);
                                            if(vp.equals("NaN")){
                                                vp="0.0";
                                            }
                                %>
                        <tr><td><%=rs.getInt(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=vp%></td></tr>
                        <%
                                }
                                i++;
                            }
                        %>
                    </table>
                    <br>
                    <%
                                    rs = stmt.executeQuery("select max(cid) from state");
                                    int max = 25;
                                    if(rs.next()){
                                    max = rs.getInt(1);
                                    }
                                    if(lt>=max){
                                        lt=st;
                                    }
                                    %>
                    <center>   <a href="seepercentvoting.jsp?cid=<%=lt%>">next</a></center>
                </div>
            </div>
            <!--<div id="ft"></div>-->
        </div>
    </body>
</html>
