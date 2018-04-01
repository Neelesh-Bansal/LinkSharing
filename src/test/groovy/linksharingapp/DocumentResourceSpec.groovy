package linksharingapp

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class DocumentResourceSpec extends Specification implements DomainUnitTest<DocumentResource> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }

    void "Validating filePath"(){
        when:
        DocumentResource documentResource = new DocumentResource(filePath: "")
        boolean result = documentResource.validate()

        then:
        result == false
    }
}
