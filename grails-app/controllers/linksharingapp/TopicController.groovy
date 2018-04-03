package linksharingapp

import linksharingapp.enumeration.Visibility
import linksharingapp.enumeration.Seriousness

class TopicController {

    def index() { }

    def show(Long id) {
        println(id)
        Topic topic = Topic.read(id)
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


    def delete(Long id){
        Topic topic = Topic.load(id)
        if(topic) {
            println(topic.name)
            topic.discard()
            println(topic.delete(flush:true))
            render("Topic Deleted Successfully")
        }
        else {
            render("Topic Not Found")
        }
    }


    def save(Topic topic,String seriousness){
        Topic topic1 = new Topic(name: topic,createdBy: session.user,visibility: Visibility.stringToEnum(visibility))
        if(topic1.save()){
            render("Topic saved Successfully")
        }
        else{
            render("Topic not saved")
        }
    }


}
