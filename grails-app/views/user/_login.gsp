%{--calling from login/index--}%
<div class="panel panel-default">
    <div class="panel-heading" >
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

            %{--<div>--}%
                %{--<a href="#myModal5" data-toggle="modal" data-target="#myModal5">--}%
                    %{--<i>ForgotPassword</i>--}%
                %{--</a>--}%
            %{--</div>--}%
            %{--<g:render template="/user/forgotPassword"></g:render>--}%

            <g:submitButton name="button" value="Login"/>
        </g:form>
    </div>
</div>