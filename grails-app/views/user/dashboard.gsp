<html>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<asset:stylesheet href="application.css"/>
<asset:javascript src="application.js"/>

%{--<meta name="layout" content="application">--}%
<body>
    <div class="col-lg-5">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-lg-3">
                        <ls:userImage height="100" width="100"></ls:userImage>
                    </div>
                    <div class="col-lg-9">
                        <div class="text">
                            <h4>Neelesh Bansal</h4>
                        </div>
                        <div class="text-muted">@neelesh</div>
                        <div class="col-lg-4">
                            <span class="text-muted">Subscriptions</span>
                            <span class="text-primary">50</span>
                        </div>
                        <div class="col-lg-3">
                            <span class="text-muted">Topics</span>
                            <span class="text-primary">30</span>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="text-primary">Subscriptions</span>
                    <span style="float: right">
                        <a href="#" class="hyperlink" >View All</a>
                    </span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-3">
                            <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
                        </div>
                        <div class="col-lg-9">
                            <div class="text-primary">
                                <a class="hyperlink" href="#">Grails</a>
                            </div>
                            <div class="col-lg-4" style="padding-left: 0px">
                                <span class="text-muted">@neelesh</span>
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
                    <div class="row">
                        <div class="col-lg-3">
                            <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
                        </div>
                        <div class="col-lg-9">
                            <div class="text-primary">
                                <a class="hyperlink" href="#">Grails</a>
                            </div>
                            <div class="col-lg-4" style="padding-left: 0px">
                                <span class="text-muted">@neelesh</span>
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


                        <div style="float:right; padding-right: 15px">
                            <span class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Serious
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="#">VERYSERIOUS</a></li>
                                    <li><a href="#">SERIOUS</a></li>
                                    <li><a href="#">CASUAL</a></li>
                                </ul>
                            </span>
                            <i class="far fa-envelope fa-2x"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Trending topics
                </div>
                <div class="panel-body">
                    <ls:trendingTopics/>
                    %{--<g:render template='/topic/showTrendingTopics' var="demo3" collection="${topicList}"></g:render>--}%
                    %{--<div class="row" style="padding-bottom:10px">--}%
                        %{--<div class="col-lg-3">--}%
                            %{--<asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>--}%
                        %{--</div>--}%
                        %{--<div class="col-lg-9">--}%
                            %{--<div class="text-primary">--}%
                                %{--<a class="hyperlink" href="#">Grails</a>--}%
                            %{--</div>--}%
                            %{--<div class="col-lg-4" style="padding-left: 0px">--}%
                                %{--<span class="text-muted">@neelesh</span>--}%
                                %{--<a href="#" class="hyperlink">Unsubscribe</a>--}%
                            %{--</div>--}%
                            %{--<div class="col-lg-4">--}%
                                %{--<span class="text-muted">Subscriptions</span>--}%
                                %{--<span class="text-primary">50</span>--}%
                            %{--</div>--}%
                            %{--<div class="col-lg-4">--}%
                                %{--<span class="text-muted">Posts</span>--}%
                                %{--<span class="text-primary">30</span>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%

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


                        %{--<span class="dropdown col-lg-offset-2">--}%
                            %{--<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Serious--}%
                                %{--<span class="caret"></span>--}%
                            %{--</button>--}%
                            %{--<ul class="dropdown-menu">--}%
                                %{--<li><a href="#">VERYSERIOUS</a></li>--}%
                                %{--<li><a href="#">SERIOUS</a></li>--}%
                                %{--<li><a href="#">CASUAL</a></li>--}%
                            %{--</ul>--}%
                        %{--</span>--}%

                        %{--<span class="dropdown">--}%
                            %{--<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">--}%
                                %{--<span class="caret"></span>--}%
                            %{--</button>--}%
                            %{--<ul class="dropdown-menu">--}%
                                %{--<li><a href="#">Private</a></li>--}%
                                %{--<li><a href="#">Public</a></li>--}%
                            %{--</ul>--}%
                        %{--</span>--}%
                        %{--<i class="far fa-envelope fa-2x"></i>--}%
                        %{--<i class="far fa-file fa-2x"></i>--}%
                        %{--<i class="far fa-trash-alt fa-2x"></i>--}%

                    </div>
                </div>
            </div>
        </div>
    </div>






    <div class="col-lg-7">
        <div class="panel panel-default">
            <div class="panel-heading">
                Inbox
            </div>
            <div class="panel-body">
                <div class="row" style="padding-bottom: 10px">
                    <div class="col-lg-3">
                        <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
                    </div>
                    <div class="col-lg-9">
                        <span class="text">Neelesh Bansal</span>
                        <span class="text-muted">@neelesh 5min</span>
                        <span class="text-primary" style="float: right">Grails</span>
                        <div class="text">
                            <p>
                                This is Neelesh Bansal. Welcome to you all
                                over here and its time to say good bye wef
                            </p>
                        </div>
                        <div>
                            <span class="fab fa-facebook fa-1x">   </span>
                            <span class="fab fa-tumblr fa-1x">  </span>
                            <span class="fab fa-google-plus-g fa-1x">  </span>
                        </div>

                        <div class="col-lg-2">
                            <a href="#" class="text-primary" style="text-decoration: underline;">Download</a>
                        </div>
                        <div class="col-lg-3">
                            <a href="#" class="text-primary" style="text-decoration: underline;">View Full Site</a>
                        </div>
                        <div class="col-lg-3">
                            <a href="#" class="text-primary" style="text-decoration: underline;">Mark As Read</a>
                        </div>
                        <div class="col-lg-2">
                            <a href="#" class="text-primary" style="text-decoration: underline;">View Post</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3">
                    <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
                </div>
                <div class="col-lg-9">
                    <span class="text">Neelesh Bansal</span>
                    <span class="text-muted">@neelesh 5min</span>
                    <span class="text-primary" style="float: right">Grails</span>
                    <div class="text">
                        <p>
                            This is Neelesh Bansal. Welcome to you all
                            over here and its time to say good bye wef
                        </p>
                    </div>
                    <div>
                        <span class="fab fa-facebook fa-1x">   </span>
                        <span class="fab fa-tumblr fa-1x">  </span>
                        <span class="fab fa-google-plus-g fa-1x">  </span>
                    </div>

                    <div class="col-lg-2">
                        <a href="#" class="text-primary" style="text-decoration: underline;">Download</a>
                    </div>
                    <div class="col-lg-3">
                        <a href="#" class="text-primary" style="text-decoration: underline;">View Full Site</a>
                    </div>
                    <div class="col-lg-3">
                        <a href="#" class="text-primary" style="text-decoration: underline;">Mark As Read</a>
                    </div>
                    <div class="col-lg-2">
                        <a href="#" class="text-primary" style="text-decoration: underline;">View Post</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
</body>
</html>