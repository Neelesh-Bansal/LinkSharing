%{--Whenever user click on topic name it will work--}%

<div class="container">
<div class="col-lg-5">
    <div class="row">

        %{--<div class="panel panel-default">--}%
                %{--<div class="panel-heading">Recent shares</div>--}%
                %{--<div class="panel-body">--}%

                    %{--<div class="row" style="padding-bottom: 8px">--}%
<g:render template='/topic/showTopic' var="demo5" collection="${topic1}"></g:render>
</div>
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">Users: "${topic1.name}"</div>
            <div class="panel-body">

                <div class="row" style="padding-bottom: 8px">
        <g:render template='/user/show' var="demo6" collection="${users1}"></g:render>
    </div>
            </div>
        </div>
    </div>

</div>

    %{--</div>--}%
%{--</div>--}%
%{--</div>--}%
    <div class="col-lg-1"></div>
<div class="col-lg-6">
     <div class="row">



     <div class="panel panel-default">
                <div class="panel-heading">Recent shares</div>
                <div class="panel-body">

                    <div class="row" style="padding-bottom: 8px">
<g:render template='/topic/showLinkResources' var="demo4" collection="${resource1}"></g:render>
</div>

</div>
</div>

</div>
</div>
</div>