<html>
<head>
    <asset:stylesheet src="header.css"/>
    <asset:stylesheet href="application.css"/>
    <asset:javascript src="application.js?compile=false"/>
    <script>
        function startTime() {
            var today = new Date();
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            m = checkTime(m);
            s = checkTime(s);
            document.getElementById('txt').innerHTML =
                h + ":" + m + ":" + s;
            var t = setTimeout(startTime, 500);
        }

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i
            }
            ;  // add zero in front of numbers < 10
            return i;
        }
    </script>
</head>

<body onload="startTime()">
<div id="txt"></div>

<body>
<g:if test="${!session.user}">
    <div class="page-header well" style="margin-top: 0px">
        <span>
            <a class="text-primary" href="#" style="text-decoration: underline">Link Sharing</a>
        </span>
        <g:form class="search" url="[controller: 'resource', action: 'search']">

            <span><i class="fa fa-search"></i></span>
            <input id="inputSearch" placeholder="Search" name="key">
            <span><i class=" fa fa-times"></i></span>
        </g:form>
    </div>
</g:if>
<g:else>
    <header class="page-header well" style="padding-bottom: 50px ; margin-top: 0px">
        <div class="col-lg-5">
            <span>

                <a class="text-primary" href="#" style="text-decoration: underline">Link Sharing</a>

            </span>
        </div>

        <div class="col-lg-7">
            <div class="col-lg-5">
                <g:form class="search" url="[controller: 'resource', action: 'search']">

                    <span><i class="fa fa-search"></i></span>
                    <input id="inputSearch" placeholder="Search" name="key">
                    <span><i class=" fa fa-times"></i></span>
                </g:form>

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
                    %{--<i class="fas fa-user" style="font-size:24px"></i>--}%
                    <% linksharingapp.User user1 = session.user
                    %>
                    <ls:userImage username="${user1.username}" class="img-circle" height="25" width="25"></ls:userImage>
                    ${session.user.firstName}
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <g:if test="${session.user.admin}">
                        <li><g:link controller="admin" action="userList">View All Users</g:link></li>
                    </g:if>
                    <li><g:link controller="user" action="profile">Edit Profile</g:link></li>
                    <li><g:link controller="login" action="logout">Logout</g:link></li>
                </ul>
            </span>
        </div>
    </header>
</g:else>
<g:layoutBody/>
</body>
</html>