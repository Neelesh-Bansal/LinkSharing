package linksharingapp

import sun.security.pkcs11.Secmod

class LoginController {

    static defaultAction = "home"

    def home(){
        println("Home.....")
        List<Resource> resources1 = Resource.topPost()
        List<Resource> resources2 = Resource.recentShares()
        render (view: 'index', model: [resourceList1:resources1,resourceList2:resources2])
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
            forward(action: 'home')
        }

        //render("${username}  ${password}")

    }

    def logout() {
        session.invalidate()
        forward(controller: 'login' , action: 'home')

    }


    def register(String firstName, String lastName, String email, String username, String password, String confirmPassword) {

        def file=params.photo
        byte[] photo = file.bytes

        User user = new User(email: email, username: username, password: password, confirmPassword: confirmPassword, firstName: firstName, lastName: lastName,photo: photo, active: true, admin: false)
        User.withNewTransaction {
            if (user.save()) {
                flash.message = "User Saved Successfully"
                forward(action: 'home')
            } else {
                flash.error = "User Not Saved"
                forward(action: 'home')
            }
        }
    }
}
