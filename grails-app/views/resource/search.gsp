<div class="container">
    <div class="col-lg-4">
        <div class="row">

            <div class="panel panel-default">
                <div class="panel-heading">Trending Topics"</div>
                <div class="panel-body">
            <ls:trendingTopics/>
                </div>
                </div>
        </div>



        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">Top Post</div>
                <div class="panel-body">

                    <div class="row" style="padding-bottom: 8px">
                        <ls:topPost />
                    </div>
                </div>
            </div>
        </div>
    </div>



<div class="col-lg-8">
    <div class="panel panel-default">
        <div class="panel-heading">Search for : ${resourceList[0].topic.name} </div>
            <div class="panel-body">
            <g:render template='/resource/show' var="sh" collection="${resourceList}"></g:render>
        </div>
    </div>

</div>

</div>
