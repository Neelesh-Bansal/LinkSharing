package linksharingapp

import linksharingapp.enumeration.Visibility
import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class ResourceRatingSpec extends Specification implements DomainUnitTest<ResourceRating> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect: "fix me"
        true == true
    }


    void "Validating Resouce Rating"() {
        setup:
        User user1 = new User(email: "neelesh@ttn.com", username: "neeleshbansal", password: "abc123", firstName: "neelesh", lastName: "bansal", photo: 1, admin: true, active: null)
        Topic topic1 = new Topic(name: "Topic1", createdBy: user1, visibility: Visibility.PUBLIC)

        User user2 = new User(email: "sankalp@ttn.com", username: "jsankalp", password: "abcd1234", firstName: "sankalp", lastName: "jain", photo: 1, admin: false, active: null)
        Topic topic2 = new Topic(name: "Topic2", createdBy: user2, visibility: Visibility.PUBLIC)
        Resource resource = new LinkResource(createdBy: user1, description: "hello", topic: topic1, url: "https://www.google.com")

        when:
        ResourceRating resourceRating = new ResourceRating(resource: resource, user: user1, score: 5)
        boolean b = resourceRating.validate()

        then:
        b == true


        when:
        //score cannot be greater than 5
        ResourceRating resourceRating2 = new ResourceRating(resource: resource, user: user2, score: 8)
        b = resourceRating2.validate()

        then:
        b == false

        when:
        //resourse and score cannot be null
        ResourceRating resourceRating3 = new ResourceRating(resource: null, user: user2, score: null)
        b = resourceRating3.validate()

        then:
        b == false

    }

}
