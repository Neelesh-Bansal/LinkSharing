<div id="myModal4" class="modal fade" role="dialog">
    <div class="modal-dialog">


        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Share Document</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="#">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="document">Document*:</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="document" name="document">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="descrip1">Description*:</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="5" id="descrip1"></textarea>
                        </div>
                    </div>
                    <div class="dropdown">
                        <label class="control-label col-sm-2" for="topic1">Topic*:</label>

                        <button class="btn btn-default dropdown-toggle" type="button"
                                data-toggle="dropdown" id="topic1">Topic
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="#">Topic1</a></li>
                            <li><a href="#">Topic2</a></li>
                        </ul>
                    </div>
                    <div class="form-group">
                        <br>
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">share</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>