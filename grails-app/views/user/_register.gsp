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

        <label>Photo *</label>
        <input class="form-control" type="file" name="photo" >

            <g:submitButton name="button2" value="Submit"/>
        </g:form>
    </div>
</div>