%{--calling from login/index--}%
<!doctype HTML>
<html>
<head>

</head>

<body>
<div class="panel panel-primary forgot-pass">
    <div class="panel-heading" style="background-color: rgba(0, 188, 212, 0.58); ">
        <h3 class="panel-title">Forgot Password</h3>
    </div>

    <div class="panel-body">
        <g:form class="form-box" name="login" controller="login">
            <div>
                <g:textField name="username" class="form-control form-register-field" placeholder="Username"/>
            </div>
            <div>
                <g:textField name="email" class="form-control form-register-field" placeholder="Email"/>
            </div>
            <br>
            <g:actionSubmit name="button" value="submit" action="sendingMail" style="width: 75%; margin-left: 10%;"
                            class="btn form-btn"/>
        </g:form>
    </div>
</div>

</body>
</html>
