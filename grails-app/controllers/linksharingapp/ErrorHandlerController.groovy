package linksharingapp

class ErrorHandlerController {

    def handle404(){
        redirect(controller:'user' , action: 'index')
    }

    def index() { }
}
