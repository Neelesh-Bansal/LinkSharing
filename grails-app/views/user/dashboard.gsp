<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<asset:stylesheet href="application.css"/>
<asset:javascript src="application.js"/>

<body>
<div class="col-lg-5">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-body">
                <g:if test="${flash.error}">
                    <g:message message="${flash.error}"></g:message>

                </g:if>
                <g:if test="${flash.message}">
                    <g:message message="${flash.message}"></g:message>

                </g:if>
                <div class="col-lg-3">
                    <ls:userImage height="100" width="100"></ls:userImage>
                </div>

                <div class="col-lg-9">
                    <div class="text">
                        <h4>${session.user.firstName} ${session.user.lastName}</h4>
                    </div>

                    <div class="text-muted">${session.user.username}</div>

                    <div class="col-lg-4">
                        <span class="text-muted">Subscriptions</span>
                        <ls:subscriptionCount></ls:subscriptionCount>
                    </div>

                    <div class="col-lg-3">
                        <span class="text-muted">Resources</span>
                        <ls:resourceCount></ls:resourceCount>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="row">

        <div class="panel panel-default">
            <div class="panel-heading">
                <span class="text-primary">Subscriptions</span>
            </div>

            <div class="panel-body">
                <ls:topicCreated/>
                <hr>

                <p>------------------</p>
                <ls:subscribedTopics/>
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
            <g:render template="inbox" collection="${unReadItems}" var="unReadResource"></g:render>
        </div>

        <div class="panel-footer">
            <br/>
            <g:paginate total="${total}" prev="Previous" next="Next" controller="user" action="index" max="5"/><br/>
        </div>
    </div>
</div>
</body>
</html>