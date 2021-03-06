<div class="row">
    <div class="col-lg-2">
        <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
    </div>

    <div class="col-lg-10">
        <span class="text">${demo.createdBy.firstName}</span>
        <span class="text-muted">@${demo.createdBy.username} 5min</span>
        <span class="text-primary" style="float: right">${demo.topic.name}</span>

        <p class="text">${demo.description}</p>

        <div>
            <span class="fab fa-facebook fa-1x"></span>
            <span class="fab fa-tumblr fa-1x"></span>
            <span class="fab fa-google-plus-g fa-1x"></span>
            <a href="${createLink(controller: 'resource', action: 'show', id: demo.id)}" class="text-primary pull-right"
               style="text-decoration: underline">view post</a>
        </div>
    </div>
</div>
