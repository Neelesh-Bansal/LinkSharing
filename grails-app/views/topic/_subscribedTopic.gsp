<%@ page import="linksharingapp.Subscription" %>
<div class="panel-body">
    <div class="row">
        <div class="col-sm-12">
            <div class="row">
                <div class="col-sm-3 fa fa-user fa-5x">

                </div>

                <div class="col-sm-9">

                    <a href="${createLink(controller: 'topic', action: 'show', id: topicc.id)}">${topicc.name}</a>
                    <br>

                    <div class="row">
                        <div class="col-sm-6">
                            <h6 class="text-muted">${topicc.createdBy.name}</h6>

                            <g:link controller="subscription" action="delete"
                                    id="${topicc.id}">Unsubscribe</g:link>
                        </div>

                        <div class="col-sm-2">
                            <h6 class="text-muted pull-left">Subscriptions</h6>
                            <h6 class="text-primary">
                                <ls:subscriptionCount topicId="${topicc.id}"></ls:subscriptionCount>
                            </h6>
                        </div>

                        <div class="col-sm-3">
                            <h6 class="text-muted  pull-right">Post
                                <br>
                                <br>

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
                        <%
                            linksharingapp.Subscription subscription = Subscription.findByTopicAndUser(topicc, session.user) %>
                        <select name="updatedSeriousness" id="updateSeriousness"
                                onchange="changeSeriousness(${subscription.id}, this.value)">
                            <option class="placeholder" selected disabled
                                    value="">${subscription.seriousness}</option>
                            <option value="${linksharingapp.enumeration.Seriousness.VERY_SERIOUS}">Very Serious</option>
                            <option value="${linksharingapp.enumeration.Seriousness.SERIOUS}">Serious</option>
                            <option value="${linksharingapp.enumeration.Seriousness.CASUAL}">Casual</option>
                        </select>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function changeSeriousness(id, value) {
        $.ajax({
            type: 'post',
            data: {'id': id, 'seriousness': value},
            url: '/subscription/update',
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