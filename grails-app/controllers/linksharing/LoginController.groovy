package linksharing

import linksharingapp.User

class LoginController {

    def index() {
        render (view: 'index')
        if(session.user){
            forward(controller: 'user' , action: 'index')
        }
        else{
            render "session.user doesn't exist"
        }
    }

    def loginHandler(String username, String password) {
//        String username = params.username
//        String password = params.password

        println(username)
        println(password)

        User user = User.findByUsernameAndPassword(username,password)
        if(user){
            if(user.active){
                session.user = user
                redirect(controller: "login", action: 'index')
            }
            else{
                flash.error = "Your account is not active"
            }
        }
        else{
            flash.error = "User not found"
            render(view: 'error')
        }

        //render("${username}  ${password}")

    }

    def logout() {
        session.invalidate()
        forward(controller: 'login' , action: 'index')

    }
}
