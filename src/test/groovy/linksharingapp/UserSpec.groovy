package linksharingapp

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class UserSpec extends Specification implements DomainUnitTest<User> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == true
    }

    //Write test cases for validating user (including username and email uniqueness)

   void "validating user constraints"(){
        setup:
        User user = new User(email: email,username: uname,password: pass,confirmPassword: pass, firstName: fname,lastName: lname,photo: photo,admin: admin,active: active)
        when:
        Boolean result = user.validate()
        then:
        result == value

        where:
        email                    | uname        | pass       | fname       | lname    | photo | admin | active | value
        "neelesh@tothenew.com"   |"neelesh"     |"abc123"    |"neelesh"    | "bansal" | 1     | true  | true   |  true
        //Email
        "neelesh@tothenew"       |"neelesh"     |"abc123"    |"neelesh"    | "bansal" | 1     | true  | true   |  false
        null                     |"neelesh"     |"abc123"    |"neelesh"    | "bansal" | 1     | true  | true   |  false
        //password
        "neelesh@tothenew.com"   |"neelesh"     |"abc"       |"neelesh"    | "bansal" | 1     | true  | true   |  false
        "neelesh@tothenew.com"   |"neelesh"     |""          |"neelesh"    | "bansal" | 1     | true  | true   |  false
        //firstname
        "neelesh@tothenew.com"   |"neelesh"     |"abc123"    |""           | "bansal" | 1     | true  | true   |  false
        "neelesh@tothenew.com"   |"neelesh"     |"abc123"    |null         | "bansal" | 1     | true  | true   |  false
        //lastname
        "neelesh@tothenew.com"   |"neelesh"     |"abc123"    |"neelesh"    | ""       | 1     | true  | true   |  false
        "neelesh@tothenew.com"   |"neelesh"     |"abc123"    |"neelesh"    | null     | 1     | true  | true   |  false
        //photo
        "neelesh@tothenew.com"   |"neelesh"     |"abc123"    |"neelesh"    | "bansal" | 0     | true  | true   |  true
        //admin
        "neelesh@tothenew.com"   |"neelesh"     |"abc123"    |"neelesh"    | "bansal" | 1     | false  | true   |  true
        //active
        "neelesh@tothenew.com"   |"neelesh"     |"abc123"    |"neelesh"    | "bansal" | 1     | true  | false   |  true
    }

    void "validating uniqueness of email"(){
        setup:
        User user = new User()
        user.setEmail("neelesh@gmail.com")
        user.setFirstName("neelesh")
        user.setLastName("bansal")
        user.setPassword("abc123")
        user.setConfirmPassword("abc123")
        user.setUsername("neeleshbansal")
        when:
        user.save()
        then:
        user.count() == 1
        User user2 = new User()
        user2.setEmail("neelesh@gmail.com")
        user2.setFirstName("nakul")
        user2.setLastName("bansal")
        user2.setPassword("abcd12")
        user2.setConfirmPassword("abcd12")
        user2.setUsername("nakulbansal")
        when:
        user2.save()
        then:
        user2.count() == 1
    }

    void "validating uniqueness of username"() {
        setup:
        String uname = "neeleshbansal"
        User user = new User()
        user.setEmail("neelesh@gmail.com")
        user.setFirstName("neelesh")
        user.setLastName("bansal")
        user.setPassword("abc123")
        user.setConfirmPassword("abc123")
        user.setUsername(uname)
        when:
        user.save()
        then:
        user.count() == 1
        User user2 = new User()
        user2.setEmail("bansal@gmail.com")
        user2.setFirstName("nakul")
        user2.setLastName("bansal")
        user2.setPassword("abcd12")
        user2.setConfirmPassword("abcd12")
        user2.setUsername(uname)
        when:
        user2.save()
        then:
        user2.count() == 1
    }

    def "validating toString method"(){

        setup:

        User user = new User(email: "neelesh@ttn.com",username: "neelesh.bansal",password: "abc123",confirmPassword: "abc123", firstName: "neelesh",lastName: "bansal")

        when:
        user.save()

        then:
        user.toString() == "User{username='${user.username}'}"
    }


    void "validating name"(){
        setup:
        User user1 = new User(email: "neelesh@ttn.com",username: "neelesh.bansal",password: "abc123",confirmPassword: "abc123",firstName: "neelesh",lastName: "bansal")

        when:
        user1.save()

        then:
        user1.getName() == "neelesh bansal"
    }
  }
