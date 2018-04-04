<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js" integrity="sha384-SlE991lGASHoBfWbelyBPLsUlwY1GwNDJo3jSJO04KZ33K2bwfV9YBauFfnzvynJ" crossorigin="anonymous"></script><title>Title</title>
    <asset:stylesheet src="header.css"/>
    %{--<meta name="viewport" content="width=device-width, initial-scale=1">--}%
    %{--<asset:stylesheet href="application.css"></asset:stylesheet>--}%
    %{--<asset:javascript src="application.js"></asset:javascript>--}%
    %{--<asset:stylesheet src="header.css"></asset:stylesheet>--}%
    %{--<g:layoutHead/>--}%
</head>
<body>
<g:if test="${!session.user}">
  <div class="page-header well">
    <span>
        <a class="text-primary" href="#" style="text-decoration: underline">Link Sharing</a>
    </span>
    <span class="search">
        <span class="fa fa-search"></span>
        <input placeholder="Search ">
        <span>
            <i class=" fa fa-times"></i>
        </span>
    </span>
  </div>
</g:if>
<g:else>
    <header class="page-header well" style="padding-bottom: 50px">
        <div class="col-lg-5">
            <span>

                <a class="text-primary" href="#" style="text-decoration: underline">Link Sharing</a>

            </span>
        </div>
        <div class="col-lg-7">
            <div class="col-lg-5">
                <span class="search">
                    <span>
                        <i class=" fa fa-times"></i>
                    </span>
                    <span class="fa fa-search"></span>
                    <input placeholder="Search term">

                </span>

            </div>
            <span class="col-lg-1">
                <a href="#myModal" data-toggle="modal" data-target="#myModal">
                    <i class="fas fa-comment" style="font-size:24px"></i>
                </a>
            </span>

            <g:render template="/layouts/createTopic"></g:render>


            <span class="col-lg-1">
                <a href="#myModal2" data-toggle="modal" data-target="#myModal2">
                    <i class="far fa-envelope" style="font-size:24px"></i>
                </a>
            </span>

            <g:render template="/layouts/sendInvitation"></g:render>


            <span class="col-lg-1">
                <a href="#myModal3" data-toggle="modal" data-target="#myModal3">
                    <i class="fas fa-link" style="font-size:24px"></i>
                </a>
            </span>

            <g:render template="/layouts/createLinkResource"></g:render>


            <span class="col-lg-1">
                <a href="#myModal4" data-toggle="modal" data-target="#myModal4">
                    <i class="far fa-file" style="font-size:24px"></i>
                </a>
            </span>

            <g:render template="/layouts/createDocumentResouce"></g:render>


            <span class="col-lg-3 dropdown">

                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="fas fa-user" style="font-size:24px"></i>
                    neelesh
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">Profile</a></li>
                    <li><a href="#">Users</a></li>
                    <li><a href="#">Topic</a></li>
                    <li><a href="#">Posts</a></li>
                    <li><a href="#">Logout</a></li>
                </ul>
            </span>
        </div>
    </header>
</g:else>
<g:layoutBody/>
</body>
</html>