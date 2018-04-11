<div class="col-lg-12" style="margin-top: 20px">
<div class="col-lg-7">
    <g:if test="${flash.error}">
        <g:message message="${flash.error}"></g:message>

    </g:if>
    <g:if test="${flash.message}">
        <g:message message="${flash.message}"></g:message>

    </g:if>
    <div class="row">
        <div class="col-lg-6">
            <ls:userImage username="${user1.username}" height="100" width="100"/>
        </div>

        <div class="col-lg-6">

            <p>${user1.firstName}<br>
                <div class="text-muted">@${user1.username}</div>
            </p>
        </div>
    </div>
</div>
<div class="col-lg-5">
    <div class="row">
    <div class="col-lg-8">
    <span>Subscriptions:
        <ls:subscriptionCount username="${user1.username}"></ls:subscriptionCount>
    </span>

    <span>Resources:
        <ls:resourceCount user11="${user1}"></ls:resourceCount>
    </span>
    </div>
    <div class="col-lg-4">

                <span>Active
                    <p class="text-primary">
                    <a href="${createLink(controller: 'user', action: 'state', id: user1.id)}">${user1.active.toString().toUpperCase()}
                    </a>
                </span>

            </div>
    </div>
</div>
</div>

