%{--calling from login/index--}%
<div class="panel panel-default">
    <div class="panel-heading">
        Sign Up
    </div>
    <div class="panel-body">
        <g:uploadForm url="[controller:'login', action:'register']" enctype="multipart/form-data" >

            <div class="form-group">
                <label class="control-label col-lg-4">First Name</label>

                <div class="col-lg-8">
                    <input type="text" class="form-control" name="firstName" value="${user?.firstName}">
                </div>
                <g:hasErrors bean="${user}" field="firstName">
                    <g:eachError bean="${user}" field="firstName">
                        <p style="color: red;"><g:message error="${it}"/></p>
                    </g:eachError>
                </g:hasErrors>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-4">Last Name</label>

                <div class="col-lg-8">
                    <input type="text" class="form-control" name="lastName" value="${user?.lastName}">
                </div>
                <g:hasErrors bean="${user}" field="lastName">
                    <g:eachError bean="${user}" field="lastName">
                        <p style="color: red;"><g:message error="${it}"/></p>
                    </g:eachError>
                </g:hasErrors>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-4">Email</label>

                <div class="col-lg-8">
                    <input type="text" class="form-control" name="email" value="${user?.email}">
                </div>

                <g:hasErrors bean="${user}" field="email">
                    <g:eachError bean="${user}" field="email">
                        <p style="color: red;"><g:message error="${it}"/></p>
                    </g:eachError>
                </g:hasErrors>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-4">Username</label>

                <div class="col-lg-8">
                    <input type="text" class="form-control" id="username" name="username" value="${user?.username}">
                </div>

                <g:hasErrors bean="${user}" field="username">
                    <g:eachError bean="${user}" field="username">
                        <p style="color: red;"><g:message error="${it}"/>
                        %{--<g:message code="default.not.unique.message" args="[]"></g:message>--}%
                        </p>
                    </g:eachError>
                </g:hasErrors>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-4">Password</label>

                <div class="col-lg-8">
                    <input type="password" class="form-control" name="password" value="${user?.password}">
                </div>

                <g:hasErrors bean="${user}" field="password">
                    <g:eachError bean="${user}" field="password">
                        <p style="color: red;"><g:message error="${it}"/></p>
                    </g:eachError>
                </g:hasErrors>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-4">Confirm Password</label>

                <div class="col-lg-8">
                    <input type="password" class="form-control" name="confirmPassword">
                </div>

                <g:hasErrors bean="${user}" field="confirmPassword">
                    <g:eachError bean="${user}" field="confirmPassword">
                        <p style="color: red;"><g:message error="${it}"/></p>
                    </g:eachError>
                </g:hasErrors>
            </div>

            <div class="form-group">
                 <div class="col-lg-8">
        <label>Photo *</label>
        <input class="form-control" type="file" name="photo" >
                 </div>
            </div>

            <g:submitButton name="button2" value="Submit"/>
        </g:uploadForm>
    </div>
</div>