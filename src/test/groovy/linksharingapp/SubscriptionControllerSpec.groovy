package linksharingapp

import grails.testing.gorm.DomainUnitTest
import grails.testing.web.controllers.ControllerUnitTest
import linksharingapp.enumeration.Seriousness
import linksharingapp.enumeration.Visibility
import spock.lang.Specification

class SubscriptionControllerSpec extends Specification implements ControllerUnitTest<SubscriptionController>,DomainUnitTest<Subscription> {

    def setup() {
        mockDomain(User)
        mockDomain(Topic)
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == true
    }

    def"testing delete"(){
        setup:

        when:
        controller.delete(15)
        then:
        response.contentAsString == "Subscription not found with this id - 15"
    }


    def "testing update"(){
        setup:
        User user = new User(email:"neelesh@ttn.com",username: "neeleshbansal",password: "abc123",firstName: "neelesh",lastName: "bansal",photo: 1,admin: true,active: null)
        session.user=user
        Topic topic=new Topic(name: "Topic5",createdBy: session.user,visibility:Visibility.PUBLIC)
        topic.save(flush:true,failOnError:true)
        user.addToTopics(topic)
        user.save()
        Subscription subscription = new Subscription(id: 1,user: user,topic: topic,seriousness: Seriousness.CASUAL )
        subscription.save()
        when:
        controller.update(subscription.id=10,"SERIOUS")
        then:
        response.contentAsString=="Subscription not found"

    }

    def "testing save"(){
        setup:
        User user = new User(email:"neelesh@ttn.com",username: "neeleshbansal",password: "abc123",confirmPassword:"abc123" ,firstName: "neelesh",lastName: "bansal",photo: 1,admin: true,active: null)
        session.user=user
        Topic topic=new Topic(name: "Topic5",createdBy: session.user,visibility:Visibility.PUBLIC)
        topic.save()
        user.addToTopics(topic)
        user.save()
        when:
        controller.save(topic.id)
        then:
        response.contentAsString=="success"

    }
}
