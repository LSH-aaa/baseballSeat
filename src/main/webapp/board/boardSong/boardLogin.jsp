<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24. 9. 20.
  Time: 오후 4:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>
        <form action="/board/login" method="post">
            <h3>로그인 하기</h3>
            <p>
            <h3>아이디</h3>
            <input type="text" name="id">
            </p>
            <p>
            <h3>비밀번호</h3>
            <input type="password" name="pwd">
            </p>
            <p><small>forget password?</small></p>
            <button value="submit">LOGIN</button>
        </form>
    </div>
</body>
</html>
