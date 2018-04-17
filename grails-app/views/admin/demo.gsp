<html>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        UserList
    </div>

    <div class="panel-body">
        <g:render template="allUsers" var="user1" collection="${user1}"></g:render>
    </div>

    <div class="panel-footer">
        <br/>
        <g:paginate total="${total}" prev="Previous" next="Next" controller="admin" action="userList" max="3"/><br/>
    </div>
</div>
</body>
</html>





