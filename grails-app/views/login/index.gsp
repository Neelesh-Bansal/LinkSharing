<%@ page import="linksharingapp.Resource" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js" integrity="sha384-SlE991lGASHoBfWbelyBPLsUlwY1GwNDJo3jSJO04KZ33K2bwfV9YBauFfnzvynJ" crossorigin="anonymous"></script><title>Title</title>

<meta name="layout" content="application">
<body>
<div class="container">

  <div class="col-lg-7">
     <div class="row">



     <div class="panel panel-default">
                <div class="panel-heading">Recent shares</div>
                <div class="panel-body">
                    <g:render template='/login/showRecentShares' var="demo2" collection="${resourceList2}"></g:render>
                    <div class="row" style="padding-bottom: 8px">
                        %{--<div class="col-lg-2">--}%
                            %{--<asset:image class="img-responsive" src="image.jpg" alt="neelesh"/>--}%
                        %{--</div>--}%
                        %{--<div class="col-lg-10">--}%
                            %{--<span class="text">Neelesh Bansal</span>--}%
                            %{--<span class="text-muted">@neelesh 5min</span>--}%
                            %{--<span class="text-primary" style="float: right">Grails</span>--}%
                            %{--<div class="text">--}%
                                %{--<p>--}%
                                    %{--This is Neelesh Bansal. Welcome to you all--}%
                                    %{--over here and its time to say good bye wef--}%
                                    %{--djcbkdb wehkfbiwebf kjbwefu kjbf ouf jbwefw--}%
                                    %{--utru ejberuj euj eru ejbfek--}%
                                %{--</p>--}%
                            %{--</div>--}%
                            %{--<div>--}%
                                %{--<span class="fab fa-facebook fa-1x">   </span>--}%
                                %{--<span class="fab fa-tumblr fa-1x">  </span>--}%
                                %{--<span class="fab fa-google-plus-g fa-1x">  </span>--}%
                                %{--<a href="#" class="text-primary" style="text-decoration: underline;float: right">View post</a>--}%
                            %{--</div>--}%
                        %{--</div>--}%
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
                        %{--<div class="col-lg-2">--}%
                            %{--<img class="img-responsive" src="image.jpg" alt="neelesh">--}%
                        %{--</div>--}%
                        %{--<div class="col-lg-10">--}%
                            %{--<span class="text">Neelesh Bansal</span>--}%
                            %{--<span class="text-muted">@neelesh 10min</span>--}%
                            %{--<span class="text-primary" style="float: right">Grails</span>--}%
                            %{--<div class="text">--}%
                                %{--<p>--}%
                                    <g:render template='/login/showTopPost' var="demo" collection="${resourceList1}"></g:render>
                                %{--</p>--}%
                            %{--</div>--}%
                            %{--<div>--}%
                                %{--<span class="fab fa-facebook fa-1x">   </span>--}%
                                %{--<span class="fab fa-tumblr fa-1x">  </span>--}%
                                %{--<span class="fab fa-google-plus-g fa-1x">  </span>--}%
                                %{--<a href="#" class="text-primary" style="text-decoration: underline;float: right">View post</a>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    </div>
               </div>
        </div>
     </div>
  </div>


  <div class="col-lg-1">
  </div>


  <div class="col-lg-4">
     <div class="row">

     	<div class="panel panel-default">
                <div class="panel-heading" >
                    Login
                </div>
                <div class="panel-body">
                    <g:if test="${flash.error}">
                        <g:message message="${flash.error}"></g:message>

                    </g:if>
                    <g:if test="${flash.message}">
                        <g:message message="${flash.message}"></g:message>

                    </g:if>
<g:form controller="login" action="loginHandler" method="POST">

    <label>Username</label>
    <input class="form-control" type="text" name="username" placeholder="Enter Your Username">

    <label>Password</label>
    <input class="form-control" type="password" name="password" placeholder="Enter Your Password">

    <p><a href="#">Forgot Password</a></p>
    <g:submitButton name="button" value="Login"/>
</g:form>
</div>
</div>

</div>

<div class="row">
 <div class="panel panel-default">
<div class="panel-heading">
    Sign Up
</div>
<div class="panel-body">
    <g:form url="[controller:'login', action:'register']" method="POST">

        <label>First Name *</label>
        <input class="form-control" type="text" name="firstName" >

        <label>Last Name *</label>
        <input class="form-control" type="text" name="lastName" >

        <label>Email *</label>
        <input class="form-control" type="email" name="email" >

        <label>Username *</label>
        <input class="form-control" type="text" name="username" >

        <label>Password *</label>
        <input class="form-control" type="password" name="password" >

        <label>Confirm Password *</label>
        <input class="form-control" type="password" name="confirmPassword" >

        %{--<label>Photo *</label>--}%
        %{--<input class="form-control" type="file" name="photo" >--}%

        <g:submitButton name="button2" value="Submit"/>
    </g:form>
</div>
</div>
</div>

</div>

</div>
</body>
</html>
