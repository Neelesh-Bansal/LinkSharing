<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Trending topics
        </div>
        <div class="panel-body">
            <g:render template='/topic/showTrendingTopics' var="demo3" collection="${topicList}"></g:render>



            <div class="row" style="padding-bottom:10px">
                <div class="col-lg-3">
                    <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
                </div>
                <div class="col-lg-9">
                    <div class="text-primary">
                        <a class="hyperlink" href="#">Grails</a>
                    </div>
                    <div class="col-lg-4" style="padding-left: 0px">
                        <span class="text-muted">@${demo3.createdBy.username} 5min</span>
                        <a href="#" class="hyperlink">Unsubscribe</a>
                    </div>
                    <div class="col-lg-4">
                        <span class="text-muted">Subscriptions</span>
                        <span class="text-primary">50</span>
                    </div>
                    <div class="col-lg-4">
                        <span class="text-muted">Posts</span>
                        <span class="text-primary">30</span>
                    </div>
                </div>
            </div>




            <div class="row">
                <div class="col-lg-3">
                    <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
                </div>
                <div class="col-lg-9">
                    <div>
                        <div class="col-lg-6" style="padding-left: 0px">
                            <input type="text" placeholder="Grails">
                        </div>
                        <div class="col-lg-3">
                            <button type="submit">Save</button>
                        </div>
                        <div class="col-lg-3">
                            <button type="reset">Cancel</button>
                        </div>
                    </div>
                    <div class="col-lg-4" style="padding-left: 0px">
                        <span class="text-muted">@neelesh</span>
                        <a href="#" class="hyperlink">Unsubscribe</a>
                    </div>
                    <div class="col-lg-4">
                        <span class="text-muted">Subscriptions</span>
                        <span class="text-primary">50</span>
                    </div>
                    <div class="col-lg-2">
                        <span class="text-muted">Posts</span>
                        <span class="text-primary">30</span>
                    </div>
                </div>


                <span class="dropdown col-lg-offset-2">
                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Serious
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">VERYSERIOUS</a></li>
                        <li><a href="#">SERIOUS</a></li>
                        <li><a href="#">CASUAL</a></li>
                    </ul>
                </span>

                <span class="dropdown">
                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">Private</a></li>
                        <li><a href="#">Public</a></li>
                    </ul>
                </span>
                <i class="far fa-envelope fa-2x"></i>
                <i class="far fa-file fa-2x"></i>
                <i class="far fa-trash-alt fa-2x"></i>

            </div>
        </div>
    </div>
</div>