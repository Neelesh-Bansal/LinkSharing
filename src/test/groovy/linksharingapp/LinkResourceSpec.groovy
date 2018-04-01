package linksharingapp

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class LinkResourceSpec extends Specification implements DomainUnitTest<LinkResource> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }


    void "validating url"(){
        when:
        LinkResource linkResource = new LinkResource(url: url1)
        boolean result = linkResource.validate()

        then:
        result == isValid

        where:

        url1                        | isValid
        ""                          | false
        null                        | false
        "http/www.google.com"       | false
        "hello123"                  | false

    }
}
