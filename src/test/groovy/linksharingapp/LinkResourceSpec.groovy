package linksharingapp

import linksharingapp.enumeration.Visibility
import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class LinkResourceSpec extends Specification implements DomainUnitTest<LinkResource> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect: "fix me"
        true == true
    }


    def "validating toString method"() {

        setup:

        User user = new User(email: "neelesh@ttn.com", username: "neelesh.bansal", password: "abc123", firstName: "neelesh", lastName: "bansal")
        Topic topic = new Topic(name: "Topic1", createdBy: user, visibility: Visibility.PUBLIC)
        when:
        Resource linkResource = new LinkResource(url: "https://www.google.com", description: 'Hello from Topic1', createdBy: user, topic: topic)
        linkResource.save()

        then:
        linkResource.toString() == "LinkResource{url='${linkResource.url}'}"
    }


    void "validating url"() {
        when:
        LinkResource linkResource = new LinkResource(url: url1)
        boolean result = linkResource.validate()

        then:
        result == isValid

        where:

        url1                  | isValid
        ""                    | false
        null                  | false
        "http/www.google.com" | false
        "hello123"            | false

    }
}
