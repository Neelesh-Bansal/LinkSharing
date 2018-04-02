package linksharingapp

import linksharingapp.enumeration.Visibility
import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class TopicSpec extends Specification implements DomainUnitTest<Topic> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == true
    }


    def "validating toString method"(){

        setup:

        User user = new User(email: "neelesh@ttn.com",username: "neelesh.bansal",password: "abc123",firstName: "neelesh",lastName: "bansal")
        Topic topic = new Topic(name: "Topic1",createdBy: user,visibility: Visibility.PUBLIC)
        when:
        topic.save()

        then:
        topic.toString() == "Topic{name='${topic.name}'}"
    }


    void "Validating Topic constraints"(){

        setup:
        User user1 = new User(email:"neelesh@ttn.com",username: "neeleshbansal",password: "abc123",firstName: "neelesh",lastName: "bansal",photo: 1,admin: true,active: null)
        Topic topic1 = new Topic(name: name1,createdBy: user1,visibility: visibility)
        when:
        boolean result = topic1.validate()

        then:
        result == value

        where:
        name1      | visibility         |value

        "Topic1"   | Visibility.PRIVATE |true

        //name
        ""         |Visibility.PUBLIC   |false
        null       |Visibility.PUBLIC   |false

        //visibility
        "Topic1"   | null               |false

    }

    void "validating uniqueness of createdBy"() {
        setup:
        User user1 = new User()
        user1.setEmail("neelesh@gmail.com")
        user1.setFirstName("neelesh")
        user1.setLastName("bansal")
        user1.setPassword("abc123")
        user1.setUsername("neelesh.bansal")
        when:
        Topic topic1 = new Topic(name: "Topic1",createdBy: user1,visibility: Visibility.PUBLIC)
        topic1.save()
        then:
        topic1.count() == 1

        when:
        Topic topic2 = new Topic(name: "Topic1",createdBy: user1,visibility: Visibility.PUBLIC)
        topic2.save()
        then:
        topic2.count() == 1
    }


}
