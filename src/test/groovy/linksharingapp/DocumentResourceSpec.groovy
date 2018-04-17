package linksharingapp

import linksharingapp.enumeration.Visibility
import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class DocumentResourceSpec extends Specification implements DomainUnitTest<DocumentResource> {

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
        Resource documentResource = new DocumentResource(filePath: "Document1", description: 'Hello from Topic1', createdBy: user, topic: topic)
        documentResource.save()

        then:
        documentResource.toString() == "DocumentResource{filePath='${documentResource.filePath}'}"
    }


    void "Validating filePath"() {
        when:
        DocumentResource documentResource = new DocumentResource(filePath: "")
        boolean result = documentResource.validate()

        then:
        result == false
    }
}
