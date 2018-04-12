<div class="row">
    <div class="col-lg-3">
        <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
    </div>
    <div class="col-lg-9">
        <span class="text">${unReadResource.resource.createdBy.firstName}</span>
        <span class="text-muted">@${unReadResource.resource.createdBy.username} 5min</span>
        <a href="#"
           class="text-primary pull-right">${unReadResource.resource.topic.name}</a>

        <div class="text">
            <p>
                ${unReadResource.resource.description}
            </p>
        </div>

        <div>
            <div class="col-lg-2" style="padding-left: 0px;padding-right: 0px">
                <i class="fab fa-facebook fa-2x"></i>
                <i class="fab fa-tumblr fa-2x"></i>
                <i class="fab fa-google-plus-g fa-2x"></i>
            </div>


            <g:if test="${linksharingapp.Resource.findTypeOfResource(unReadResource.resource.id) == "DocumentResource"}">
                <div class="col-lg-4">
                    <a href="${createLink(controller: "documentResource",action: "show", id: "${unReadResource.resource.id}")}" class="text-primary" style="text-decoration: underline;" target="_blank">Download</a>
                </div>
            </g:if>

            <g:else>
                <div class="col-lg-4">
                    <a href="${unReadResource.resource.url}" target="_blank" class="text-primary" style="text-decoration: underline;">View Full Site</a>
                </div>
            </g:else>

            <div class="col-lg-4">
                <a href="#" class="text-primary" style="text-decoration: underline;">
                    <ls:checkRead resource="${unReadResource.resource}"></ls:checkRead>
                </a>
            </div>

            <div class="col-lg-2">
                <a href="${createLink(controller: 'resource',action: 'show',id:unReadResource.resource.id)}" class="text-primary pull-right"
                   style="text-decoration: underline">view post</a>
            </div>
        </div>
    </div>
</div>