<%@ page import="linksharingapp.User; linksharingapp.Topic" %>
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
                    <input class="form-control" type="text" name="link" placeholder="Name">

                    <label>Description*:</label>
                    <g:textArea name="des" value="Description*" rows="10" cols="65"/>
                    <br>
                    <label>Topic*:</label>
                    <g:select name="topic" optionKey="id" optionValue="name"
                              from="${session.user.getSubscribedTopics()}"/>
                    <br><br>
                    <g:submitButton name="button" value="Save"/>
                    <g:actionSubmit value="Cancel" controller="login" action="home"/>
                </g:form>
            </div>
        </div>

    </div>
</div>