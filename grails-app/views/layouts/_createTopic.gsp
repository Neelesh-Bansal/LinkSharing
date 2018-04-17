<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Topic</h4>
            </div>

            <div class="modal-body">
                <g:form controller="topic" action="save" method="POST">

                    <label>Name*:</label>
                    <input class="form-control" type="text" name="name" placeholder="Name">

                    <label>Visibility*:</label>
                    <g:select name="visibility" from="${['PUBLIC', 'PRIVATE']}"/>
                    <g:submitButton name="button" value="Save"/>
                    <g:actionSubmit value="Cancel" controller="login" action="home"/>
                </g:form>
            </div>
        </div>

    </div>
</div>