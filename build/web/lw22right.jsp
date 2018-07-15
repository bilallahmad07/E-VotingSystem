<div id="lw22right" style="margin-top: -27px;">
    <div id="up">
        <a href="http://eci.nic.in/eci_main1/ecz.aspx" style="color: black; text-decoration: none; font-size: 16px;">
            <img src="images/cec_nz.jpg" style="margin-left: 25%; width: 50%; margin-top: 10px; border: 2px solid #666666;"/>
            <br>
            <center>Dr. Nasim Zaidi<br>Cheif  Election Commisioner</center></a>
    </div>
    <div id="middle">
        <table style="text-align: center; width: 100%; height: 98%; margin-top: 5px; ">
            <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/Linkto_electo_search.aspx">Search your name in voter's list</a></td></tr>
            <tr class="tr2"><td><a href="http://psleci.nic.in/">Know your Polling Station</a></td></tr>
            <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/tm.aspx">Training Material</a></td></tr>
            <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/electoral_law.aspx">Election Laws & instructions</a></td></tr>
        </table>
    </div>
    <%! int n;%>
    <%@include file="driver.jsp"%> 
    <%        
        PreparedStatement ps = conn.prepareStatement("select * from visitor");
        ResultSet rs = ps.executeQuery();
        rs.next();
        n = rs.getInt(1);
        n = n + 1;
        ps = conn.prepareStatement("update visitor set count = ?");
        ps.setInt(1, n);
        ps.executeUpdate();
    %>
    <div id="down" >
        <br>
        <center><span style="font-size: 20px; font-weight: 500;">Visitor Number : <br><%=n%>th<br></span></center>
    </div>
</div>