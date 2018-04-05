<div id="myModal4" class="modal fade" role="dialog">
    <div class="modal-dialog">


        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Share Document</h4>
            </div>
            <div class="modal-body">
                <g:form controller="documentResource" action="save" method="POST">

                    <label>Document*:</label>
                    <g:uploadForm name="file">
                        <input type="file" name="file" />
                    </g:uploadForm>


                    <label>Description*:</label>
                    <g:textArea name="des" value="Description*" rows="10" cols="65"/>
                    <br>
                    <label>Topic*:</label>
                    <g:select name="topic" optionKey="id" optionValue="name" from="${session.user.getSubscribedTopics()}"/>
                    <br><br>
                    <g:submitButton name="button" value="Save"/>
                    <g:actionSubmit value="Cancel" controller="login" action="home"/>
                </g:form>
            </div>
        </div>
    </div>
</div>