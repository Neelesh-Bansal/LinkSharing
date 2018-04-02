package linksharing


class ApplicationInterceptor {

    ApplicationInterceptor(){
        matchAll()
    }

    boolean before() {
        if (!session.user)
        {
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
