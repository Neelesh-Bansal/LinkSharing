package linksharingapp

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class LoginControllerSpec extends Specification implements ControllerUnitTest<LoginController> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == true
    }

   def " index testing"(){
        setup:

        when:
        //session.user="neelesh"
        controller.index()

        then:
        response.forwardedUrl == null // if session exist
    }

//    def " loginHandler testing"(){
//        setup:
//
//
//        when:
//        controller.loginHandler('neeleshbansal','Admin123')
//
//        then:
//        response.redirectedUrl == '/login/index'
//    }

    def "logout testing"(){
        when:
        controller.logout()

        then:
        response.forwardedUrl == '/'
    }
}
