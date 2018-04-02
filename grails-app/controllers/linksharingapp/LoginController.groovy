package linksharingapp

class LoginController {

    static defaultAction = "home"

    def home(){
        println("Home.....")
        render (view: 'index')
    }

    def index() {
        if(session.user){
            redirect(controller: 'user' , action: 'index')
        }
        else{
            render "session.user doesn't exist"
        }
    }

    def loginHandler(String username, String password) {
        User user = User.findByUsernameAndPassword(username,password)
        if(user){
            if(user.active){
                session.user = user
                redirect(action: "index")
            }
            else{
                flash.error = "Your account is not active"
                log.error("User not active")
                render(view: 'error')
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
        forward(controller: 'login' , action: 'home')

    }


    def register(){

        User user = new User(email: params.email,username: params.username , password: params.password,confirmPassword: params.confirmPassword,firstName: params.firstName, lastName: params.lastName)
        if(user.save()){
            flash.message="User Saved Successfully"
        }
        else {
            flash.error="User Not Saved"
        }
    }
}
