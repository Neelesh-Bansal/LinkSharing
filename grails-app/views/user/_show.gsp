%{--in process--}%
<div class="row">
    <div class="col-lg-2">
        %{--${demo6.photo}--}%
        <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
    </div>

    <div class="col-lg-10">
        <span class="text">${demo6.name}</span>
        <span class="text-muted">@${demo6.username}</span>

    </div>

    <div class="col-lg-4">
        <span class="text-muted">Subscriptions</span>
        <ls:subscriptionCount username="${demo6.username}"></ls:subscriptionCount>
    </div>

    <div class="col-lg-4">
        <span class="text-muted">Posts</span>
        <ls:resourceCount user11="${demo6}"></ls:resourceCount>
    </div>
</div>