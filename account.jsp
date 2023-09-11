<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="USE `cocktail`";
con.createStatement().execute(sql);

try{
  //從資料庫獲取member
  String username = (String) session.getAttribute("username");
  sql = "SELECT * FROM `member` WHERE username = '" + username + "'";
  ResultSet rs = con.createStatement().executeQuery(sql);
  if(rs.next()){

%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員介面</title>
    <link rel="icon" href="image/logo.ico" type="image/x-icon">
    <link rel="stylesheet" href="assets/CSS/header.css">
    <link rel="stylesheet" href="assets/CSS/acccar.css">
</head>
<body>
  <header>
    <div id="Top"></div>
      <div class="logo">
        <img src="image/logo.png" style="width:120px;height:150px" >
      </div> 
      <div class="login">
        <a href="./login.html"><img src="image/login.png" style="width:60px;height:60px"></a>
      </div> 
      <div class="accpic">
        <a href="./account.jsp"><img src="image/account.png" style="width:50px;height:50px"></a>
      </div>
      <div class="car">
        <a href="./car.html"><img src="image/shop.png" style="width:50px;height:50px" ></a>
    </div>
  </header> 

  <div class="backtotop">
    <a href="#Top" title="回到最上方">
      <img src="image/top.png">
    </a>
  </div>

  <nav>
    <a href="./index.html">HOME</a>&emsp;
    <a href="./shop.html">SHOP</a>&emsp;
    <a href="./customized.html">CUSTOMIZED</a>&emsp;
    <a href="./about.html">ABOUT US</a>
  </nav>

  <div class="member-info">
    <div class="member-in">
      <div class="title">
        <h2>會員資料</h2>
        <img src="image/haewon.jpg" class="haewon">
      </div>
       
      <div class="info">
        
        <!-- todo: 更新資料 -->
        <form action="check_account.jsp">
          <label for="name">姓名</label>
          <input type="text" name="name" value="<%= rs.getString("name") %>">
          
          <label for="email">電子信箱</label>
          <input type="text" name="email" value="<%= rs.getString("email") %>">
          
          <label for="birth">生日</label>
          <input type="date" name="birth" value="<%= rs.getString("birth") %>">
          
          <button type="submit" style="margin-top: 10px;">儲存變更</button>
        </form>
<%
  } else {
    con.close();
    out.print("<script>");
    out.print("alert('連線逾時，請重新登入');");
    out.print("window.location.href='login.html';");
    out.print("</script>");
  }
} catch (Exception sExec) {
  con.close();
  out.println("SQL錯誤"+sExec.toString());
  out.print("<script>");
  out.print("alert('連線逾時，請重新登入');");
  out.print("window.location.href='login.html';");
  out.print("</script>");
}

%>
        
      </div>
    </div>
  
    <div class="member-in" >
      <div class="title">
        <h2>修改密碼</h2>
      </div>
      <div class="info">
        <!-- 檢查密碼 -->
        <form action="chage_password.jsp">
          
          <label for="password1">密碼</label>
          <input type="password" name="password1" placeholder="請輸入新密碼">
          
          <label for="password2">確認新密碼</label>
          <input type="password" name="password2" placeholder="再輸入一次密碼">
          
          <button type="submit">保存</button>
        </form>
      </div>
    </div>

      
    <div class="purchase-history">
      <h2>購買紀錄</h2>
      <table>
        <thead>
          <tr>
            <th>訂單編號</th>
            <th>商品名稱</th>
            <th>購買日期</th>
            <th>金額</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>001</td>
            <td>liz酒</td>
            <td>2023-02-14</td>
            <td>$850</td>
          </tr>
          <tr>
            <td>002</td>
            <td>女巫酒</td>
            <td>2023-04-06</td>
            <td>$1245</td>
          </tr>
          <tr>
            <td>003</td>
            <td>內格羅尼</td>
            <td>2023-05-22</td>
            <td>$350</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
    
  <footer>
    Copyright
    <sup>©</sup>
    2023 by 卡拉雞尾酒🍸
  </footer>

</body>
</html>