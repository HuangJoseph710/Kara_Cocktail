<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/CSS/shop.css">
    <link rel="stylesheet" href="assets/CSS/header.css">
    <link rel="icon" href="image/logo.ico" type="image/x-icon">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="assets/CSS/shop.css"></script>
    <script src="assets/JS/shop2.js"></script>
    <title>卡拉雞尾酒🍸</title>
</head>
<body>
    <!-- header部分 -->
    <header>
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
<!-- ---------------------------------------------------------- -->
<!-- ------------------------------------------------------------------------- -->
    <div id="shop2">
        <div class="gotobuy">
            <img id="productionimg">
            <div id="productionname"></div><br>
            <div id="productionprice"></div>
            <div class="number">
                <input type="button" id="down" value="-"></input>
                <input type="text" id="num" value="0" ></input>
                <input type="button" id="up" value="+"></input>
            </div>
            <br><br>
            <div class="function">
                <input type="button" id="buy" value="直接購買">
                <input type="button" id="addcart" value="加入購物車">
            </div>
            <div id="productiondescription"></div>
        </div>
        <!-- ---------------------------------------------------------- -->
        <p><h1 id="discussionid" class="discussion">---討論版---</h1></p><br>

        <div class="writeboard">
            <!-- 送出留言 -->
            <form action="add_message.jsp">
                <input type="hidden" name="pid" value="<%=request.getParameter("id")%>">
                <input type="text" name="msg_name" id="inputaccount" placeholder="輸入使用者名稱">
                <!-- <input type="text" id="inputtitle" placeholder="輸入主旨"> -->
                <div class="inputword">
                    <textarea name="message" id="" cols="50" rows="10" placeholder="撰寫內容"></textarea>
                </div>
                <div class="send">
                    <input  class="sub" type="submit" value="送出" width="10px">
                    <input  class="res" type="reset" value="取消" width="10px">
                </div>
            </form>

            <div class="others">
                <!-- 留言板 -->

                <table class="msgboard">
<%
//<script>
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql = "";
sql="USE `cocktail`";
con.createStatement().execute(sql);
sql="SELECT * FROM `message` WHERE `pid` =" + request.getParameter("id");
ResultSet rs;
rs=con.createStatement().executeQuery(sql);

//判斷是否有找到評論
if (!rs.isBeforeFirst()) {
%>
                    <tr><td><strong>暫無任何評論</strong></td></tr>
<%
} else {
    while (rs.next()) {
%>
                    <tr><td><strong><%=rs.getString(2)%></strong>　　&nbsp;&nbsp;&nbsp;&nbsp;<tt><%=rs.getString(3)%></tt></td></tr>
                    <tr><td><%=rs.getString(4)%></td></tr>
<%
    }
}
con.close();

%>
                </table>
            </div>
            
        
        <!-- --------------------------------------------------------- -->
        </div>
        <img id="showimg">
    <footer>
        Copyright
        <sup>©</sup>
        2023 by 卡拉雞尾酒🍸
    </footer>
</body>
</html>