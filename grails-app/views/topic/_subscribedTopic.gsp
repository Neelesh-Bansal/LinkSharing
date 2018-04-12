<div class="panel-body">
    <div class="row">
        <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-3 fa fa-user fa-5x">

                    </div>

                    <div class="col-sm-9">

                        <a href="#" class="pull-left">${topicc.name}</a>
                        <br>

                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="text-muted">${topicc.createdBy.name}</h6>

                                <g:link controller="subscription" action="subscriptionDelete"
                                        id="${topicc.id}">Unsubscribe</g:link>
                            </div>

                            <div class="col-sm-2">
                                <h6 class="text-muted pull-left">Subscriptions</h6>
                                <h6 class="text-primary">
                                    <ls:subscriptionCount topicId="${topicc.id}"> </ls:subscriptionCount>
                                </h6>
                            </div>

                            <div class="col-sm-3">
                                <h6 class="text-muted  pull-right">Post
                                    <br>
                                    <br>
                                    <p class="text-primary">
                                        <ls:resourceCount id="${topicc.id}"> </ls:resourceCount>
                                    </p>
                                </h6>
                            </div>
                            <span type="img" class="fa fa-envelope pull-right fa-2x"
                                  style="margin-left: 10px;color: #007efc;"></span>

                            <select class="pull-right">
                                <option>Serious</option>
                                <option>Casual</option>
                                <option>Very Serious</option>
                            </select>

                        </div>
                    </div>
                </div>
        </div>
    </div>
</div>