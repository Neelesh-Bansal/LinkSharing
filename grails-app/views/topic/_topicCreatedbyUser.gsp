<div id="topic-${topicc.id}" class="col-sm-12">
    <div class="row">
        <div class="col-sm-3 fa fa-user fa-5x">
        </div>

        <div class="col-sm-9">

            <a href="#" class="pull-left">${topicc.name}</a>
            <br>

            <div class="row">
                <div class="col-sm-6">
                    <h6 class="text-muted">${topicc.createdBy.username}</h6>


                    <form id="deleteTopic">

                        <input type="hidden" value="${topicc.id}" name="id">

                        <div class="form-group">
                            <input type="button" id="${topicc.id}" value="Delete Topic" class="btn btn-primary topicdelete"/>
                        </div>
                    </form>




                    %{--<g:link controller="topic" action="delete"--}%
                    %{--id="${topicc.id}">Delete Topic</g:link>--}%
                </div>

                <div class="col-sm-2">
                    <h6 class="text-muted pull-left">Subscriptions</h6>
                    <h6 class="text-primary">
                        <ls:subscriptionCount topicId="${topicc.id}"></ls:subscriptionCount>
                    </h6>
                </div>

                <div class="col-sm-3">
                    <h6 class="text-muted  pull-right">Post
                        <p class="text-primary">
                            <ls:resourceCount id="${topicc.id}"></ls:resourceCount>
                        </p>
                    </h6>
                </div>

                %{--<span type="img" class="glyphicon glyphicon-trash pull-right fa-2x"--}%
                %{--style="margin-left: 10px;color: #007efc;">--}%
                %{--<a href="#"></a>--}%
                %{--</span>--}%

                <span type="img" class="fa fa-file pull-right fa-2x"
                      style="margin-left: 10px;  margin-right: 5px;color: #007efc;">

                </span>

                <span type="img" class="fa fa-envelope pull-right fa-2x" style="margin-left: 10px;color: #007efc;">

                </span>

                <select class="pull-right">
                    <option>Serious</option>
                    <option>Casual</option>
                    <option>Very Serious</option>
                </select>

            </div>
        </div>
    </div>
</div>