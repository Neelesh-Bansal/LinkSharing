<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta name="layout" content="application">
</head>

<body>

<div class="col-lg-7">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <div class="col-lg-2">
                    <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
                </div>

                <div class="col-lg-10">
                    <span>${resource.createdBy.firstName}</span>
                    <span class="pull-right text-primary">
                        <a class="hyperlink">${resource.topic.name}</a>
                    </span>
                    <br>
                    <span class="text-muted">@${resource.createdBy.username}</span>
                    <span class="pull-right">${resource.dateCreated}</span>
                    <br>
                    <span class="pull-right">
                        <g:if test="${!session.user || session.user.getScore(resource)==1}">
                            <g:form url="[controller: 'resourceRating',action: 'save', params: [id: resource.id]]">
                                <g:select name="resource.rating" from="${1..5}" value="rating"></g:select>
                                <g:submitButton name="vote"></g:submitButton>
                            </g:form>
                        </g:if>
                        <g:else>
                            ${session.user.getScore(resource)}
                        </g:else>
                        <a href="#">
                            <i class="fas fa-heart"></i>
                        </a>
                        <a href="#">
                            <i class="fas fa-heart"></i>
                        </a>
                        <a href="#">
                            <i class="fas fa-heart"></i>
                        </a>
                        <a href="#">
                            <i class="far fa-heart"></i>
                        </a>
                        <a href="#">
                            <i class="far fa-heart"></i>
                        </a>
                    </span>
                </div>
            </div>

            <div class="row">
                <div class="text-justify">
                    ${resource.description}
                </div>

                <div>
                    <div class="col-lg-2" style="padding-left: 0px;padding-right: 0px">
                        <i class="fab fa-facebook fa-2x"></i>
                        <i class="fab fa-tumblr fa-2x"></i>
                        <i class="fab fa-google-plus-g fa-2x"></i>
                    </div>

                    <div class="col-lg-2">
                        <a href="${createLink(controller: 'resource',action: 'delete', id: resource.id)}" class="text-primary" style="text-decoration: underline;">Delete</a>
                    </div>

                    <div class="col-lg-2">
                        <a href="#" class="text-primary" style="text-decoration: underline;">Edit</a>
                    </div>

                    <div class="col-lg-2">
                        <a href="#" class="text-primary" style="text-decoration: underline;"><ls:checkRead resource="${resource}"></ls:checkRead></a>
                    </div>

                    <g:if test="${resourceType.equals("DocumentResource")}">
                        <div class="col-lg-2">
                            <a href="#" class="text-primary" style="text-decoration: underline;">Download</a>
                        </div>
                    </g:if>

                    <g:if test="${resourceType.equals("LinkResource")}">
                        <div class="col-lg-2">
                            <a href="${resource.url}" class="text-primary" target="_blank" style="text-decoration: underline;">View Full Site</a>
                        </div>
                    </g:if>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="col-lg-5">
    <div class="panel panel-default">
        <div class="panel-heading">
            Trending Topics
        </div>
        <ls:trendingTopics/>
        %{--<ls:getSubscribedTrendingTopics></ls:getSubscribedTrendingTopics>--}%
        %{--<ls:getUnsubscribedTrendingTopics></ls:getUnsubscribedTrendingTopics>--}%
    </div>
</div>

</body>
</html>