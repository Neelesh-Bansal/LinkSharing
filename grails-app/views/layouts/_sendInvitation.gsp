<div id="myModal2" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Send Invitation</h4>
            </div>

            <div class="modal-body">
                <g:form controller="topic" action="invite" method="POST">

                    <label>Email*:</label>
                    <input class="form-control" type="email" name="to" placeholder="Email">
                    <br>
                    <label>Topic*:</label>
                    <g:select name="topic" optionKey="id" optionValue="name"
                              from="${session.user.getSubscribedTopics()}"/>
                    <br><br>
                    <g:submitButton name="button" value="Invite"/>
                    <g:actionSubmit value="Cancel" controller="login" action="home"/>
                </g:form>

            </div>

        </div>

    </div>
</div>