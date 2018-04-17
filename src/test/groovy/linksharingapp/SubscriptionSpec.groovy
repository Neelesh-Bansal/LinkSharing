package linksharingapp

import linksharingapp.enumeration.Seriousness
import linksharingapp.enumeration.Visibility
import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class SubscriptionSpec extends Specification implements DomainUnitTest<Subscription> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect: "fix me"
        true == true
    }

    void "Validating Seriousness constraints"() {

        User user1 = new User(email: "neelesh@ttn.com", username: "neeleshbansal", password: "abc123", firstName: "neelesh", lastName: "bansal", photo: 1, admin: true, active: null)
        Topic topic1 = new Topic(name: "Topic1", createdBy: user1, visibility: Visibility.PRIVATE)

        Subscription subscription1 = new Subscription(topic: topic1, user: user1, seriousness: serious)
        when:
        boolean result = subscription1.validate()
        then:
        result == value
        where:
        serious            | value
        Seriousness.CASUAL | true

        //seriousness
        null               | false

    }

    void "Validating user constraints"() {

        User user1 = new User(email: "neelesh@ttn.com", username: "neeleshbansal", password: "abc123", firstName: "neelesh", lastName: "bansal", photo: 1, admin: true, active: null)
        Topic topic1 = new Topic(name: "Topic1", createdBy: user1, visibility: Visibility.PRIVATE)
        Subscription subscription1 = new Subscription(topic: topic1, user: null, seriousness: Seriousness.SERIOUS)
        when:
        boolean result = subscription1.validate()
        then:
        result == false
    }


    void "Validating topic constraints"() {

        User user1 = new User(email: "neelesh@ttn.com", username: "neeleshbansal", password: "abc123", firstName: "neelesh", lastName: "bansal", photo: 1, admin: true, active: null)
        Subscription subscription1 = new Subscription(topic: null, user: user1, seriousness: Seriousness.SERIOUS)
        when:
        boolean result = subscription1.validate()
        then:
        result == false
    }

}
