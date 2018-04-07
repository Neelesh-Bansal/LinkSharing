<div class="container">
    <div class="col-lg-5">
        <div class="row">

            %{--<div class="panel panel-default">--}%
            %{--<div class="panel-heading">Recent shares</div>--}%
            %{--<div class="panel-body">--}%

            %{--<div class="row" style="padding-bottom: 8px">--}%
            <ls:trendingTopics/>
        </div>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">Users:"</div>
                <div class="panel-body">

                    <div class="row" style="padding-bottom: 8px">
                        <ls:topPost />
                    </div>
                </div>
            </div>
        </div>

    </div>

    %{--</div>--}%
    %{--</div>--}%
    %{--</div>--}%
<div class="col-lg-7">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="text-primary">Search for : ${resourceList[0].topic.name}</span>
        </div>
        <div class="panel-body">
            <g:each in="${resourceList}" var="resource">
                <div class="row" style="padding-bottom: 10px">
                    <div class="col-lg-2">
                        <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
                    </div>
                    <div class="col-lg-10">
                        <span class="text">${resource.createdBy.firstName}</span>
                        <span class="text-muted">@${resource.createdBy.username} ${resource.lastUpdated}</span>
                        <span class="text-primary" style="float: right">${resource.topic.name}</span>
                        <div class="text">
                            <p>
                                ${resource.description}
                            </p>
                        </div>
                        <div>
                            <div class="col-lg-2" style="padding-left: 0px;padding-right: 0px">
                                <i class="fab fa-facebook fa-2x"> </i>
                                <i class="fab fa-tumblr fa-2x"> </i>
                                <i class="fab fa-google-plus-g fa-2x"> </i>
                            </div>
                            <div class="col-lg-2">
                                <a href="#" class="text-primary" style="text-decoration: underline;">Download</a>
                            </div>
                            <div class="col-lg-3">
                                <a href="" class="text-primary" style="text-decoration: underline;">View Full Size</a>
                            </div>
                            <div class="col-lg-3">
                                <a href="#" class="text-primary" style="text-decoration: underline;"><ls:checkRead resource="${resource}"></ls:checkRead></a>
                            </div>
                            <div class="col-lg-2">
                                <a href="#" class="text-primary" style="text-decoration: underline;">View Post</a>
                            </div>
                        </div>
                    </div>
                </div>
            </g:each>
        </div>
    </div>

</div>
