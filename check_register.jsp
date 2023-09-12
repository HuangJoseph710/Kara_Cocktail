<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>

<%
//<script>
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="USE `cocktail`";
con.createStatement().execute(sql);

//檢查註冊資料是否為空
if(request.getParameter("username") !=null && !request.getParameter("username").equals("") 
	&& request.getParameter("password") != null && !request.getParameter("password").equals("")){

    //檢查信箱是否已被註冊過
    sql = "SELECT * FROM member WHERE username ='" + request.getParameter("username") + "'";
    ResultSet rs = con.createStatement().executeQuery(sql);
    if (!rs.next()){
            
        sql = "INSERT INTO `member` (`username`, `password`) VALUES ('" 
        + request.getParameter("username") +  "','" 
        + request.getParameter("password") + "')";
        
        int row = con.createStatement().executeUpdate(sql);
        session.setAttribute("username",request.getParameter("username"));
        con.close();
        out.print("<script>");
        out.print("alert('註冊成功，請接著設定使用者資料');");
        out.print("window.location.href='account.jsp';");
        out.print("</script>");
        
    } else {
        con.close();
        out.print("<script>");
        out.print("alert('該信箱已被註冊過，請至登入頁面登入。');");
        out.print("window.location.href='login.html';");
        out.print("</script>");
    }
    

}
else{
    con.close();
    out.print("<script>");
    out.print("alert('資料未填寫完整，請重新輸入。');");
    out.print("window.location.href='register.html';");
    out.print("</script>");
}
%>