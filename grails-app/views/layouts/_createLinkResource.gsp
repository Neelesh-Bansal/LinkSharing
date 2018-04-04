<%@ page import="linksharingapp.Topic" %>
<div id="myModal3" class="modal fade" role="dialog">
    <div class="modal-dialog">


        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Link Resource</h4>
            </div>
            <div class="modal-body">
                <g:form controller="linkResource" action="save" method="POST">

                    <label>Link*:</label>
                    <input class="form-control" type="url" name="link" placeholder="Name">

                    <label>Description*:</label>
                    <g:textArea name="des" value="Description*" rows="10" cols="65"/>
<br>
                    <label>Topic*:</label>
                    <g:select name="topic" from="${linksharingapp.Topic.findAllByCreatedBy(session.user)}"/>
                    <br><br>
                    <g:submitButton name="button" value="Save"/>
                    <g:actionSubmit value="Cancel" controller="login" action="home"/>
                </g:form>
                %{--<form class="form-horizontal" action="#">--}%
                    %{--<div class="form-group">--}%
                        %{--<label class="control-label col-sm-2" for="link">Link*:</label>--}%
                        %{--<div class="col-sm-10">--}%
                            %{--<input type="url" class="form-control" id="link" placeholder="Enter link"--}%
                                   %{--name="link">--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="form-group">--}%
                        %{--<label class="control-label col-sm-2" for="descrip">Description*:</label>--}%
                        %{--<div class="col-sm-10">--}%
                            %{--<textarea class="form-control" rows="5" id="descrip"></textarea>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="dropdown">--}%
                        %{--<label class="control-label col-sm-2" for="topic">Topic*:</label>--}%

                        %{--<button class="btn btn-default dropdown-toggle" type="button"--}%
                                %{--data-toggle="dropdown" id="topic">Topic--}%
                            %{--<span class="caret"></span></button>--}%
                        %{--<ul class="dropdown-menu">--}%
                            %{--<li><a href="#">Topic1</a></li>--}%
                            %{--<li><a href="#">Topic2</a></li>--}%

                        %{--</ul>--}%
                    %{--</div>--}%
                    %{--<br>--}%

                    %{--<div class="form-group">--}%
                        %{--<div class="col-sm-offset-2 col-sm-10">--}%
                            %{--<button type="submit" class="btn btn-default">share</button>--}%
                            %{--<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</form>--}%
            </div>
        </div>

    </div>
</div>