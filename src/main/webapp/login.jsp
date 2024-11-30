
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/18/2024
  Time: 8:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>

<div class="row">
    <div class="col-4  offset-4 mt-4" >

        <div class="card">
            <div class="card-header bg-dark text-white"> 
                Login
            </div>
            <div class="card-body">

                <form action="/login" method="post">
                    <input name="phone" type="tel" autofocus placeholder="phone" class="form-control">
                    <input name="password" type="password" placeholder="password" class="form-control my-2">
                    <button class="btn btn-dark" style="float:right">Login </button>

                </form>
                &nbsp;
                &nbsp;
                &nbsp;
                <br>
                <br>
                <br>
                <a href="/newAccount.jsp">Create account</a>
            </div>

        </div>

    </div>
</div>



</body>
</html>
