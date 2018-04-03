package linksharingapp

import linksharingapp.enumeration.Visibility

class UserController {

    def index() {
        render "User Dahsboard -- "
        render (session?.user?.username)
    }

}
