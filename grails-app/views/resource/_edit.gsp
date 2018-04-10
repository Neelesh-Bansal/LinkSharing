<div id="myModal6" class="modal fade" role="dialog">
    <div class="modal-dialog">


        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit Description</h4>
            </div>
            <div class="modal-body">
                <g:form controller="resource" action="save" method="POST">
                    <g:textField name="id" value="${demo4.id}"></g:textField>
                    <textarea name="des" placeholder="${demo4.description}" rows="4" cols="24"></textarea>
                    </br>
                    <g:submitButton name="button" value="Save"/>
                    <g:actionSubmit value="Cancel" controller="user" action="index"/>
                </g:form>
            </div>
        </div>

    </div>
</div>