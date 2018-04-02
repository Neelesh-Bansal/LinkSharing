package linksharingapp

import linksharingapp.enumeration.Visibility
import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class ReadingItemSpec extends Specification implements DomainUnitTest<ReadingItem> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == true
    }


    void "validating Reading Item"(){
        setup:
        User user1 = new User(email:"neelesh@ttn.com",username: "neeleshbansal",password: "abc123",firstName: "neelesh",lastName: "bansal",photo: 1,admin: true,active: null)
        Topic topic1 = new Topic(name: "Topic1",createdBy: user1,visibility: Visibility.PUBLIC)
        Resource resource = new LinkResource(createdBy: user1, description: "hello",topic:topic1 , url: "https://www.google.com")

        when:
        ReadingItem readingItem = new ReadingItem(resource: resource,user: user1,isRead: true)
        Boolean b = readingItem.validate()

        then:
        b==true

        //resource cannot be null
        when:
        ReadingItem readingItem1 = new ReadingItem(resource: null,user: user1,isRead: true)
        b = readingItem1.validate()

        then:
        b==false
    }
}
