<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>

<%
//<script>
String username = (String) session.getAttribute("username");
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="USE `cocktail`";
con.createStatement().execute(sql);

//檢查註冊資料是否為空
if(request.getParameter("name") !=null && !request.getParameter("name").equals("") 
	&& request.getParameter("email") != null && !request.getParameter("email").equals("") 
	&& request.getParameter("birth") != null && !request.getParameter("birth").equals("")){

    sql = "UPDATE `member` SET `email` = '" +  request.getParameter("email")
    + "', `name` = '" + request.getParameter("name")
    + "', `birth` = '" + request.getParameter("birth")
    + "' WHERE `username` = '" + username + "'";

    int row = con.createStatement().executeUpdate(sql);
    session.setAttribute("name",request.getParameter("name"));
    con.close();
    out.print("<script>");
    out.print("alert('資料更新成功，請前往首頁瀏覽');");
    out.print("window.location.href='index.html';");
    out.print("</script>");


} else{
    con.close();
    out.print("<script>");
    out.print("alert('資料未填寫完整，請重新輸入。');");
    out.print("window.location.href='account.jsp';");
    out.print("</script>");
}
%>
