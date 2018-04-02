<html>
<head>

</head>

<body>
<div class="container">
<g:form controller="login" action="loginHandler" method="post">

        <label>Username</label>
        <input class="form-control" type="text" name="username" placeholder="Enter Your Username">

        <label>Password</label>
        <input class="form-control" type="password" name="password" placeholder="Enter Your Password">

        <p><a href="#">Forgot Password</a></p>
        <input type="submit" class="form-control btn-primary" style="background:blue">
</g:form>
</div>

</body>

</html>
