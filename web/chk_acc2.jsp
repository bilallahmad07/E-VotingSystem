<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! int f = 0;%>
<%! String adhar, otp, type, x, y, db_otp;%>
<%@page import="java.sql.*" %>
<%@include file="driver.jsp" %>
<%
    adhar = session.getAttribute("adhar") + "";
    type = session.getAttribute("type") + "";
    otp = request.getParameter("otp");
    db_otp = session.getAttribute("otp") + "";
    if (otp.equals(db_otp)) {
        session.setMaxInactiveInterval(600);
        if (type.equals("voter")) {
            session.setAttribute("type","voter.jsp");
            response.sendRedirect("voter.jsp");
        } 
        else if (type.equals("admin")) {
            session.setAttribute("type","admin.jsp");
            response.sendRedirect("admin.jsp");
        } 
        else if (type.equals("officer")) {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select pos from officer where adhar = '"+adhar+"'");
            rs.next();
            if((rs.getString(1)).equals("1")){
                session.setAttribute("type","officer1.jsp");
                response.sendRedirect("officer1.jsp");
            }
            else if((rs.getString(1)).equals("2")){
                session.setAttribute("type","officer2.jsp");
                response.sendRedirect("officer2.jsp");
            }
            else if((rs.getString(1)).equals("3")){
                session.setAttribute("type","officer3.jsp");
                response.sendRedirect("officer3.jsp");
            }
        }
    } 
    else {
        response.sendRedirect("error.jsp");
    }
%>
