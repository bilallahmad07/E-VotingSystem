<%@page import="java.sql.*"%>
<%!Connection conn;%>
<%

    
    Driver driver = (Driver) Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bilal", "bil1212210039");
%>