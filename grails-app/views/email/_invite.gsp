<%@ page contentType="text/html" %>
<html>
<body>
<p>Hello LinkSharing User, you can now subscribe to this topic through given link :
<g:link controller="topic" action="join" id="${link}" base="${grailsApplication.config.grails.serverURL}"></g:link>
</p>
<p>From LiskSharing Team</p>
</body>
</html>