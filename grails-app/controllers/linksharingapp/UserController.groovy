package linksharingapp

import linksharingapp.enumeration.Visibility

class UserController {

    def index() {
        render "User Dahsboard -- "
        render (session?.user?.username)
    }

    def show(Long id) {
        println(id)
        Topic topic = Topic.findById(id)
        println("Topic--${topic}")
        if(topic){
            if(topic.visibility==Visibility.PUBLIC){
               // render("Success")
                if(Subscription.findByTopicAndUser(topic,session.user)) //this is the part of else if(for Visibility.PRIVATE)
                    render(" Success for subscription")
                else {
                    flash.error = "No Subscription"
                    redirect(controller: 'login', action: 'index')
                }
            }
            else if(topic.visibility==Visibility.PRIVATE){

            }
        }
        else
        {
            flash.error = "Topic Not Found"
            redirect(controller: 'login', action: 'index')
        }
    }
}
