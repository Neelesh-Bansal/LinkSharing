%{--Calling from topic/show--}%

    <div class="panel panel-default">
        <div class="panel-heading">Topic: "${demo5.name}"</div>
        <div class="panel-body">

            <div class="row" style="padding-bottom: 8px">
<div class="row">
    <div class="col-lg-2">
        <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
    </div>

    <div class="col-lg-10">
        <span class="text">${demo5.name}</span>
        <span class="text-muted"> (${demo5.visibility})</span>
        <p class="text-muted">@${demo5.createdBy.name}</p>
    </div>
</div>
            </div>
        </div>
</div>