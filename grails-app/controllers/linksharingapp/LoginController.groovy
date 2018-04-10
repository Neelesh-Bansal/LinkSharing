package linksharingapp

import linksharingapp.dto.EmailDTO
import linksharingapp.utility.Util

class LoginController {

    static defaultAction = "home"
    def sendMailService

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


    def showForgotPassword() {
        render(view: '/user/forgotPassword')
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


        User user = new User(email: email, username: username, password: password, confirmPassword: confirmPassword, firstName: firstName, lastName: lastName,photo: params.photo.bytes, active: true, admin: false)
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


    def changePassword() {
        render(view: '/user/changePassword', model: [emailId: params.emailId])
    }




    def sendingMail() {
        if(User.findByEmailAndUsername(params.email,params.username))
        {

            Util util = new Util()
            def newPassword = Util.randomPassword

            EmailDTO emailDTO = new EmailDTO(to: params.email, subject: "Password Reset" ,from:"linksharing1@gmail.com",content:"Your new password is : ${newPassword}")
            sendMailService.sendMail(emailDTO)


            flash.message="Mail sent successlly"
            forward(action: 'home')
        }

        else
        {
            flash.error="Mail not sent please check username and email"
            forward(action: 'home')
        }
    }

}
