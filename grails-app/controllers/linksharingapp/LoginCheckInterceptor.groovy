package linksharingapp


class LoginCheckInterceptor {

    LoginCheckInterceptor() {
        matchAll().excludes(controller: 'login')
    }

    boolean before() {
        if (!session.user && controllerName != "resource") {
            redirect(controller: 'login', action: 'home')
        }
        true
    }

    boolean after() {
        true
    }

    void afterView() {
        // no-op
    }
}
