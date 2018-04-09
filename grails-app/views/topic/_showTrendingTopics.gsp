<div class="row" style="padding-bottom:10px">
    <div class="col-lg-3">
        <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
        %{--<img src="${demo3.createdBy.photo}" name="photo" >--}%
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
    <span class="dropdown col-lg-offset-2">
        <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Seriousness
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a href="#">Very Serious</a></li>
            <li><a href="#">Serious</a></li>
            <li><a href="#">Less Serious</a></li>
        </ul>
    </span>

    <span class="dropdown">
        <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Scope
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a href="#">Private</a></li>
            <li><a href="#">Public</a></li>
        </ul>
    </span>
    <a href="#">
        %{--<ls:showSubscribe></ls:showSubscribe>--}%
        <i class="far fa-envelope fa-2x"></i>
    </a>
    <a href="#">
        <i class="far fa-file fa-2x"></i>
    </a>
    <a href="#">
        <i class="far fa-trash-alt fa-2x"></i>
    </a>
</div>