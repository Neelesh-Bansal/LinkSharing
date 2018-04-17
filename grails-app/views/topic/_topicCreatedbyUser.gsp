<%@ page import="linksharingapp.Subscription" %>
<div id="topic-${topicc.id}" class="col-sm-12">
    <div class="row">
        <div class="col-sm-3 fa fa-user fa-5x">
        </div>

        <div class="col-sm-9">

            <g:form controller="topic" action="edit">
                <g:hiddenField name="id" value="${topicc.id}"></g:hiddenField>
                <g:textField name="topicname" value="${topicc.name}"></g:textField>
                <g:submitButton name="edit" value="Edit"></g:submitButton>
            </g:form>
            <br>

            <div class="row">
                <div class="col-sm-6">
                    <h6 class="text-muted">${topicc.createdBy.username}</h6>


                    <form id="deleteTopic">

                        <input type="hidden" value="${topicc.id}" name="id">

                        <div class="form-group">
                            <input type="button" id="${topicc.id}" value="Delete Topic"
                                   class="btn btn-primary topicdelete"/>
                        </div>
                    </form>




                    %{--<g:link controller="topic" action="delete"--}%
                    %{--id="${topicc.id}">Delete Topic</g:link>--}%
                </div>

                <div class="col-sm-2">
                    <h6 class="text-muted pull-left">Subscriptions</h6>
                    <h6 class="text-primary">
                        <ls:subscriptionCount topicId="${topicc.id}"></ls:subscriptionCount>
                    </h6>
                </div>

                <div class="col-sm-3">
                    <h6 class="text-muted  pull-right">Post
                        <p class="text-primary">
                            <ls:resourceCount id="${topicc.id}"></ls:resourceCount>
                        </p>
                    </h6>
                </div>


                <span class="col-lg-1">
                    <a href="#myModal2" data-toggle="modal" data-target="#myModal2">
                        <i class="far fa-envelope" style="font-size:24px"></i>
                    </a>
                </span>

                <g:render template="/layouts/sendInvitation"></g:render>


            </span>
                <%
                    linksharingapp.Subscription subscription = linksharingapp.Subscription.findByTopicAndUser(topicc, session.user) %>
                <select name="updatedSeriousness" id="updateSeriousness"
                        onchange="changeSeriousness(${subscription.id}, this.value)">
                    <option class="placeholder" selected disabled
                            value="">${subscription.seriousness}</option>
                    <option value="${linksharingapp.enumeration.Seriousness.VERY_SERIOUS}">Very Serious</option>
                    <option value="${linksharingapp.enumeration.Seriousness.SERIOUS}">Serious</option>
                    <option value="${linksharingapp.enumeration.Seriousness.CASUAL}">Casual</option>
                </select>


                <select name="updatedVisibility" id="updateVisibility"
                        onchange="changeVisibility(${topicc.id}, this.value)">
                    <option class="placeholder" selected disabled
                            value="">${topicc.visibility}</option>
                    <option value="${linksharingapp.enumeration.Visibility.PRIVATE}">PRIVATE</option>
                    <option value="${linksharingapp.enumeration.Visibility.PUBLIC}">PUBLIC</option>
                </select>

            </div>
        </div>
    </div>
</div>
<script>
    function changeVisibility(id, value) {
        console.log("inside change")
        console.log("id is : ", id)
        console.log("value is : ", value)
        $.ajax({
            type: 'post',
            data: {'id': id, 'visibility': value},
            url: '/topic/changeVisibility',
            dataType: 'json',
            success: function (res) {
                alert(res);
            },
            error: function (res) {
                $('#message').text('Error!');
                $('.dvLoading').hide();
            }
        });
    }
</script>