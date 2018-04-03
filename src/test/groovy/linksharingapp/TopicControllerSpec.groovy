package linksharingapp

import grails.testing.gorm.DomainUnitTest
import grails.testing.web.controllers.ControllerUnitTest
import linksharingapp.constants.DefaultPassword
import linksharingapp.enumeration.Visibility
import spock.lang.Specification


class TopicControllerSpec extends Specification implements ControllerUnitTest<TopicController>,DomainUnitTest<Topic> {

    def setup() {
        mockDomain(User)
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == true
    }

    def "Testing save"(){
        setup:
        User admin = new User()
        admin.setEmail("neelesh@tothenew.com")
        admin.setFirstName("neelesh")
        admin.setLastName("bansal")
        admin.setPassword(DefaultPassword.defaultPassword)
        admin.setConfirmPassword(DefaultPassword.defaultPassword)
        admin.setUsername("neeleshbansal")
        admin.setActive(true)
        admin.setAdmin(true)
        admin.save()
        session.user=admin

        when:
        controller.save("NewTopic", "SERIOUS")

        then:
        response.contentAsString == "New Topic saved Successfully"
    }


    def "testing delete"(){
        setup:
        User user = new User(email:"neelesh@ttn.com",username: "neeleshbansal",password: "abc123",firstName: "neelesh",lastName: "bansal",photo: 1,admin: true,active: null)
        session.user=user
        Topic topic=new Topic(name: "Topic5",createdBy: session.user,visibility:Visibility.PUBLIC)
        topic.save(flush:true,failOnError:true)
        user.addToTopics(topic)
        user.save()
        when:
        controller.delete(topic.id)
        then:
        response.contentAsString=="Topic Deleted Successfully"

    }

}
