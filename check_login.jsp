<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%
//<script>
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="USE `cocktail`";
con.createStatement().execute(sql);
if(request.getParameter("username") !=null && !request.getParameter("username").equals("") 
	&& request.getParameter("password") != null && !request.getParameter("password").equals("")){

    sql = "SELECT * FROM `member` WHERE `username`= ?  AND `password`= ? "; 

    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1,request.getParameter("username"));
    pstmt.setString(2,request.getParameter("password"));
	
    ResultSet rs =pstmt.executeQuery();
    
    if(rs.next()){
        session.setAttribute("username",request.getParameter("username"));
        session.setAttribute("name",rs.getString(3));
		con.close();//結束資料庫連結
        response.sendRedirect("index.html") ;
    }
    else{
		con.close();//結束資料庫連結
        out.print("<script>");
        out.print("alert('帳號或密碼錯誤，請重新輸入。');");
        out.print("window.location.href='login.html';");
        out.print("</script>");
	}
}
else{
    out.print("<script>");
    out.print("alert('帳號或密碼不可為空，請重新輸入。');");
    out.print("window.location.href='login.html';");
    out.print("</script>");
}
%>
