<div class="row">
    <div class="col-lg-2">
        <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
    </div>

    <div class="col-lg-10">
        <p class="text">${demo4.url}</p>
        <p class="text">${demo4.description}</p>
        <div>
            <span class="fab fa-facebook fa-1x">   </span>
            <span class="fab fa-tumblr fa-1x">  </span>
            <span class="fab fa-google-plus-g fa-1x">  </span>
            <a href="#" class="text-primary" style="text-decoration: underline;float: right">View post</a>
            <g:if test="${session.user.id==demo4.createdBy.id}">
                <span class="col-lg-1">
                    <a href="#myModal6" data-toggle="modal" data-target="#myModal6">
                        <i class="fas fa-edit" style="font-size:24px"></i>
                    </a>
                </span>
                <g:render template="/resource/edit"></g:render>
            </g:if>
        </div>
    </div>
</div>