<div class="row">
    <div class="col-lg-2">
        <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
    </div>

    <div class="col-lg-10">
        <span class="text">${demo2.createdBy.firstName}</span>
        <span class="text-muted">@${demo2.createdBy.username} 5min</span>
        <span class="text-primary" style="float: right">${demo2.topic.name}</span>

        <p class="text">${demo2.description}</p>

        <div>
            <span class="fab fa-facebook fa-1x"></span>
            <span class="fab fa-tumblr fa-1x"></span>
            <span class="fab fa-google-plus-g fa-1x"></span>
            <a href="#" class="text-primary" style="text-decoration: underline;float: right">View post</a>
        </div>
    </div>
</div>