%{--calling from login/index--}%
<div id="myModal5" class="modal fade" role="dialog">
    <div class="modal-dialog">


        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Forgot Password</h4>
            </div>
            <div class="modal-body">
                <g:form controller="login" action="loginHandler" method="POST">

                 <div class="form-group">
                  <label class="control-label col-sm-2" for="name1">Email*:</label>
                  <div class="col-sm-10">
                  <input type="email" class="form-control" id="name1"  name="email">
                  </div>
                 </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pass1">Password*:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="pass1"  name="pass1">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pass2">Confirm Password*:</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="pass2"  name="pass2">
                        </div>
                    </div>
                    <g:submitButton name="button" value="Save"/>
                    <g:actionSubmit value="Cancel" controller="login" action="home"/>
                </g:form>
            %{--<form class="form-horizontal" action="#">--}%
            %{--<div class="form-group">--}%
            %{--<label class="control-label col-sm-2" for="name1">name</label>--}%
            %{--<div class="col-sm-10">--}%
            %{--<input type="text" class="form-control" id="name1"  name="name1">--}%
            %{--</div>--}%
            %{--</div>--}%

            %{--<div class="dropdown">--}%
            %{--<label class="control-label col-sm-2" for="visibility">visibility*:</label>--}%

            %{--<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="visibility">--}%
            %{--<span class="caret"></span></button>--}%
            %{--<ul class="dropdown-menu">--}%
            %{--<li><a href="#">Public</a></li>--}%
            %{--<li><a href="#">Private</a></li>--}%
            %{--</ul>--}%
            %{--</div>--}%
            %{--<br>--}%
            %{--<div class="form-group">--}%
            %{--<div class="col-sm-offset-2 col-sm-10">--}%
            %{--<button type="submit" class="btn btn-default">Save</button>--}%
            %{--<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>--}%

            %{--</div>--}%
            %{--</div>--}%
            %{--</form>--}%
            </div>
        </div>

    </div>
</div>