package linksharingapp

import linksharingapp.co.ResourceSearchCO
import linksharingapp.enumeration.Visibility
import linksharingapp.enumeration.Seriousness

class TopicController {

    def index() {}

//    def show(Long id) {
//        println(id)
//        Topic topic = Topic.read(id)
//        println("Topic--${topic}")
//        if (topic) {
//            if (topic.visibility == Visibility.PUBLIC) {
//                // render("Success")
//                if (Subscription.findByTopicAndUser(topic, session.user)) //this is the part of else if(for Visibility.PRIVATE)
//                    render(" Success for subscription")
//                else {
//                    flash.error = "No Subscription"
//                    redirect(controller: 'login', action: 'index')
//                }
//            } else if (topic.visibility == Visibility.PRIVATE) {
//
//            }
//        } else {
//            flash.error = "Topic Not Found"
//            redirect(controller: 'login', action: 'index')
//        }
//    }

    def show(Long id,ResourceSearchCO resourceSearchCO){
        Topic topic = Topic.findById(id)
        List<Resource> resources = Resource.search(resourceSearchCO).list()
        //render("CreatedBy- ${topic.createdBy.firstName}")
        render(resources.createdBy.firstName)
    }


    def delete(Long id) {
        Topic topic = Topic.load(id)
       /* Topic.withNewTransaction {*/
            if (topic) {
                println(topic.name)
                topic.delete()
                    render("Topic Deleted Successfully")
            } else {
                render("Topic Not Found")
            }
    }


    def save(String name, String visibility) {
        Visibility visibility1 = Visibility.stringToEnum(visibility)
        Topic topic1 = new Topic(name: name, createdBy: session.user, visibility: visibility1)
            if (topic1.save()) {
                render("New Topic saved Successfully")
            } else {
                render("Topic not saved")
            }
    }

    def find(){
        List<Topic> topics = Topic.findAllByCreatedBy(session.user)
        render(topics.name)
    }


}
