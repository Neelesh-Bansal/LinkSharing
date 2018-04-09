<body>
<div class="col-lg-4" style="margin-left: 10px">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-lg-3">
                    <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
                    </div>
                     <div class="col-lg-9">
                     <div class="text">
                     <h4>${user.firstName}</h4>
                     </div>
                     <div class="text-muted">@${user.username}</div>
                            <div class="col-lg-4">
                            <span class="text-muted">Subscriptions</span>
                             <span class="text-primary">50</span>
                            </div>
                            <div class="col-lg-3">
                              <span class="text-muted">Topics</span>
                                <span class="text-primary">30</span>
                             </div>

</div>
</div>
</div>
</div>



</div>


<div class="col-lg-7" style="margin-left: 15px">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">Password</div>
            <div class="panel-body">
                <g:form class="form-horizontal" controller="user" action="update">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="fname">FirstName*:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="fname" id="fname" placeholder="${user.firstName}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="lname">LastName*:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="lname" id="lname" placeholder="${user.lastName}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="uname">Username*:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="uname" id="uname" placeholder="${user.username}">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <g:submitButton name="update1" value="Update"></g:submitButton>
                        </div>
                    </div>

                </g:form>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">Change Password</div>
            <div class="panel-body">
                <g:form class="form-horizontal" controller="user" action="changePassword">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pass1">Password*:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="pass1" id="pass1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pass2">Confirm Password*:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="pass2" id="pass2">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <g:submitButton name="update2" value="Update"></g:submitButton>
                        </div>
                    </div>

                </g:form>
            </div>
        </div>
    </div>


</div>
</body>