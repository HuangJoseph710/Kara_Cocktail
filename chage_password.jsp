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
if(request.getParameter("password1") !=null && !request.getParameter("password1").equals("") 
	&& request.getParameter("password2") != null && !request.getParameter("password2").equals("")) {

    if( request.getParameter("password1").equals(request.getParameter("password2")) ){
        sql = "UPDATE `member` SET `password` = '" +  request.getParameter("password1")
        + "' WHERE `username` = '" + username + "'";

        int row = con.createStatement().executeUpdate(sql);
        session.setAttribute("name",request.getParameter("name"));
        con.close();
        out.print("<script>");
        out.print("alert('密碼更新成功');");
        out.print("window.location.href='account.jsp';");
        out.print("</script>");
    
    } else {
        con.close();
        out.print("<script>");
        out.print("alert('兩次密碼不同，請重新輸入');");
        out.print("window.location.href='account.jsp';");
        out.print("</script>");
    }


} else{
    con.close();
    out.print("<script>");
    out.print("alert('資料未填寫完整，請重新輸入。');");
    out.print("window.location.href='account.jsp';");
    out.print("</script>");
}
%>
