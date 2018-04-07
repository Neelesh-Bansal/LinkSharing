package linksharingapp


class ApplicationInterceptor {

    ApplicationInterceptor(){
        matchAll().excludes(controllerName: 'resource')
    }

    boolean before() {
        log.error("Controller ${controllerName} , Action ${actionName}")
        if(controllerName !="login" && !session.user)
        {
            log.error("Unauthorized User.")
            flash.error= "session.user doesn't exist"
            return false
        }
        true
    }

    boolean after() {
        log.info("logging params of controller and actions: ${params.toString()}")
        true
    }

    void afterView() {
        // no-op
    }
}
