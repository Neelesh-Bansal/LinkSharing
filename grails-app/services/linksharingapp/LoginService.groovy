package linksharingapp

import grails.gorm.transactions.Transactional

@Transactional
class LoginService {


    User loginUser(String username, String password){
        User user = User.findByUsernameAndPassword(username,password)
        if(user){
            println("In Login Service")
            return user
        }
        else{
            return null
        }
    }

    def serviceMethod() {

    }
}
