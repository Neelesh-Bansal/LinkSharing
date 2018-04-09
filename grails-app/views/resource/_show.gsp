<%@ page import="linksharingapp.Resource" %>
%{--Not in use--}%
<div class="panel-body">
        <div class="row" style="padding-bottom: 10px">
            <div class="col-lg-2">
                <asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>
            </div>
            <div class="col-lg-10">
                <span class="text">${sh.createdBy.firstName}</span>
                <span class="text-muted">@${sh.createdBy.username}</span>
                <span class="text-primary" style="float: right">${sh.topic.name}</span>
                <div class="text">
                    <p>
                        ${sh.description}
                    </p>
                </div>
                <div>
                    <div class="col-lg-2" style="padding-left: 0px;padding-right: 0px">
                        <i class="fab fa-facebook fa-2x"> </i>
                        <i class="fab fa-tumblr fa-2x"> </i>
                        <i class="fab fa-google-plus-g fa-2x"> </i>
                    </div>
                <div class="col-lg-3">
                 <g:if test="${linksharingapp.Resource.findTypeOfResource(sh.id)=="DocumentResource"}">

                        <a href="#" class="text-primary" style="text-decoration: underline;">Download</a>
                 </g:if>
                 <g:else>

                        <a href="${sh.url}" target="_blank" class="text-primary" style="text-decoration: underline;">View Full Site</a>
                 </g:else>
                </div>
                    <div class="col-lg-3">
                        <a href="#" class="text-primary" style="text-decoration: underline;"><ls:checkRead isRead="true"></ls:checkRead></a>
                    </div>
                    <div class="col-lg-4">
                        <a href="#" class="text-primary" style="text-decoration: underline;">View Post</a>
                    </div>
                </div>
            </div>
        </div>
</div>
<hr style="border-width: 5px;" color="black">