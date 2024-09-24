<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24. 9. 20.
  Time: 오후 4:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="">
    <title>Title</title>
</head>
<body>
<%
    String userID = null;
    if(session.getAttribute("id") != null){
        userID = (String)session.getAttribute("id");
    }

    if(userID != null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 로그인이 되어있습니다.')");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    }
%>
<div>
    <form action="/board/login" method="post">
        <h3>로그인 하기</h3>
        <p>
        <h3>아이디</h3>
        <input type="text" name="id" >
        </p>
        <p>
        <h3>비밀번호</h3>
        <input type="password" name="pwd" >
        </p>
        <p><small>forget password?</small></p>
        <button value="submit" onclick="return loginCheck()">LOGIN</button>
    </form>
</div>
<script type="text/javascript" src="../../js/members.js"></script>
</body>
</html>