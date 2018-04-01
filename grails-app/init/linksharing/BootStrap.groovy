package linksharing

import enumeration.Visibility
import grails.util.Holders
import linksharingapp.User
import linksharingapp.Topic
import Constants.DefaultPassword


class BootStrap {

    def init = { servletContext ->

        log.info("**********************************************")
        println(Holders.grailsApplication.config.server.contextPath)

        if(User.count()==0) {
            createUsers()
        }
        createTopics()
    }

    void createTopics(){
        List<User> users = User.findAll()
        users.each {
            if (!it.topics)
            {
                User user = it
                5.times {
                    Topic topic = new Topic(name: "Topic${it}", visibility: Visibility.PUBLIC, createdby: user)
                    user.addToTopics(topic)
                    topic.save()
                    }
                }
            }
        }

    void createUsers() {

        User admin = new User()
        admin.setEmail("neelesh@tothenew.com")
        admin.setFirstName("neelesh")
        admin.setLastName("bansal")
        admin.setPassword(DefaultPassword.defaultPassword)
        admin.setUsername("neeleshbansal")
        admin.setActive(true)
        admin.setAdmin(true)
        if(admin.validate()){
            log.info("Admin is valid- ${admin.validate()}")
            println(admin.save())
        }
        else {
            log.error(admin.hasErrors())
        }


        User normal = new User()
        normal.setEmail("sankalp@tothenew.com")
        normal.setFirstName("sankalp")
        normal.setLastName("jain")
        normal.setPassword("normal12")
        normal.setUsername("jsankalp")
        normal.setActive(true)
        normal.setAdmin(false)
        if(normal.validate()){
            println(normal.save())
           // println(normal.save(failOnError : true,flush : true))
        }
        else {
            log.info("user has errors while validating- ${admin.hasErrors()}")
        }
    }



    def destroy = {
    }
}
