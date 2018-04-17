%{--calling from login/index--}%
<div class="panel panel-default">
    <div class="panel-heading">
        Login
    </div>

    <div class="panel-body">
        <g:if test="${flash.error}">
            <g:message message="${flash.error}"></g:message>

        </g:if>
        <g:if test="${flash.message}">
            <g:message message="${flash.message}"></g:message>

        </g:if>
        <g:form controller="login" action="loginHandler" method="POST">

            <label>Username</label>
            <input class="form-control" type="text" name="username" placeholder="Enter Your Username">

            <label>Password</label>
            <input class="form-control" type="password" name="password" placeholder="Enter Your Password">

            <g:link controller="login" action="showForgotPassword">
                <button type="button" class="btn btn-link col-xs-6 ">Forgot Password?</button>
            </g:link>
            <div></div>

            <g:submitButton name="button" value="Login"/>
        </g:form>
    </div>
</div>