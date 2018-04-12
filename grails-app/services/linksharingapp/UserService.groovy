package linksharingapp

import grails.gorm.transactions.Transactional

@Transactional
class UserService {


    def changeState(Integer id){
        println("in service--->")
        println(id)
        User user = User.findById(id)
        println(user)
        if (user.active) {
            User.executeUpdate("update User set active=:new where id=:id", [new: false, id: user.id])
        } else {
            User.executeUpdate("update User set active=:new where id=:id", [new: true, id: user.id])
        }
    }


    def serviceMethod() {

    }
}
