<%    session.invalidate();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <script type="text/javascript" src="disable.js"></script>
    </head>
    <body>
        <div id="wr" style="height: 1500px">
            <%@include file="header.jsp" %>
            <div id="lw">
                <%@include file="lw1.jsp" %>
                <div id="lw2" style="height: 1000px">
                    <br>
                    <table id="table1" border="1">
                        <tr><th>Sl. no.</th><th>State</th><th>Constituency</th><th>Winner</th><th>Party</th><th>Logo</th><th>Vote Difference</th></tr>
                        <%@include file="driver.jsp" %>
                    <%
                        int i=1;
                        String state, cons, winner, party, diff, logo;
                        Statement stmt1, stmt2, stmt3;
                        ResultSet rs1, rs2, rs3;
                        state = request.getParameter("states");
                        stmt1 = conn.createStatement();
                        stmt2 = conn.createStatement();
                        stmt3 = conn.createStatement();
                        rs1 = stmt1.executeQuery("select constituency from state where state='" + state + "'");
                        while(rs1.next()){
                            cons = rs1.getString(1);
                            rs2 = stmt2.executeQuery("select winner,party,vote_diff from state where constituency='"+cons+"'");
                            if(rs2.next()){
                                winner = rs2.getString(1);
                                party = rs2.getString(2);
                                diff = rs2.getString(3);
                                rs3 = stmt3.executeQuery("select logo from party where name='" + party + "'");
                                logo="";
                                if(rs3.next()){
                                    logo = rs3.getString(1);
                                }
                                if(winner==null){
                                    winner = "---";
                                }
                                if(party==null){
                                    party = "---";
                                }
                                if(diff==null){
                                    diff = "---";
                                }
                                %>
                                <tr><td><%=i%></td><td><%=state%></td><td><%=cons%></td><td><%=winner%></td><td><%=party%></td><td><img src="images/<%=logo%>"></td><td><%=diff%></td></tr>
                                <%
                            }
                            i = i+1;
                        }
                    %>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
