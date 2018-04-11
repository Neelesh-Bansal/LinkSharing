package linksharingapp

import grails.gorm.transactions.Transactional

@Transactional
class UserService {


    def changeState(Integer id){
        println("in service")
        println(id)
        User user = User.findById(id)
        println(user)

                if (user.active) {
                    user.active = false
                } else {
                    user.active = true
                }
        User.withNewTransaction {
                 user.save()
                    return true

            }
    }


    def serviceMethod() {

    }
}
