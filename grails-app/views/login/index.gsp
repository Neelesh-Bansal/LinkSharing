<%@ page import="linksharingapp.Resource" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<asset:stylesheet href="application.css"/>
<asset:javascript src="application.js"/>

<meta name="layout" content="application">

<body>
<div class="container">

    <div class="col-lg-7">
        <div class="row">

            <div class="panel panel-default">
                <div class="panel-heading">Recent shares</div>

                <div class="panel-body">

                    <div class="row" style="padding-bottom: 8px">
                        <g:render template='/login/showRecentShares' var="demo2"
                                  collection="${resourceList2}"></g:render>
                    </div>

                </div>
            </div>

        </div>

        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="text">Top Posts</span>
                    <span class="dropdown" style="float: right">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Today
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="#">1 Week</a></li>
                            <li><a href="#">1 Month</a></li>
                            <li><a href="#">1 Year</a></li>
                        </ul>
                    </span>
                </div>

                <div class="panel-body">
                    <div class="row">

                        %{--<ls:topPost/>--}%
                        <g:render template='/login/showTopPost' var="demo" collection="${resourceList1}"></g:render>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="col-lg-1">
    </div>


    <div class="col-lg-4">
        <div class="row">
            <g:render template='/user/login'/>
        </div>



        <div class="row">
            <g:render template='/user/register'/>
        </div>

    </div>

</div>
</body>
</html>
