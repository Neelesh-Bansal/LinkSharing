<div class="row" style="padding-bottom:10px">
    <div class="col-lg-3">
        <img src="${demo3.createdBy.photo}" name="photo" >
    </div>
    <div class="col-lg-9">
        <div class="text-primary">
            <a href="${createLink(controller: 'topic' ,action: 'show',id: demo3.id)}" >Grails</a>
        </div>
        <div class="col-lg-4" style="padding-left: 0px">
            <span class="text-muted">@${demo3.createdBy.username} 5min</span>
            <a href="#" class="hyperlink">Unsubscribe</a>
        </div>
        <div class="col-lg-4">
            <span class="text-muted">Subscriptions</span>
            <p class="text-primary">50</p>
        </div>
        <div class="col-lg-4">
            <span class="text-muted">Posts</span>
            <p class="text-primary">30</p>
        </div>
    </div>
</div>