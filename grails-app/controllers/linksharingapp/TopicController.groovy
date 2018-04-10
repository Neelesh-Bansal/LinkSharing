package linksharingapp

import linksharingapp.co.ResourceSearchCO
import linksharingapp.dto.EmailDTO
import linksharingapp.enumeration.Visibility
import linksharingapp.enumeration.Seriousness

class TopicController {
    def sendMailService

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

//    def show(Long id,ResourceSearchCO resourceSearchCO){
//        Topic topic = Topic.findById(id)
//        List<Resource> resources = Resource.search(resourceSearchCO).list()
//        //render("CreatedBy- ${topic.createdBy.firstName}")
//        render(resources.createdBy.firstName)
//    }

    def show(Long id) {
        Topic topic = Topic.findById(id)


        List<Subscription> subscriptionsList = Subscription.findAllByTopic(topic)

        List<User> users=[]
        subscriptionsList.each {
            users.add(it.user)
        }

        List<Resource> resources = LinkResource.findAllByTopic(topic)

        render(view: 'show', model: [topic1: topic, resource1: resources, users1: users])
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
        if(session.user) {
            if (topic1.save()) {
                Subscription subscription = new Subscription(topic: topic1, user: session.user, seriousness: Seriousness.VERY_SERIOUS)
                subscription.save()
                flash.message = "New Topic saved Successfully"
                redirect(controller: 'user', action: 'index')
            } else {
                flash.message = "New Topic Not Saved"
                redirect(controller: 'user', action: 'index')
            }
        }
        else{
            flash.error = "Login to continue"
            render(controller: 'login', action: 'index')
        }
    }

    def find() {
        List<Topic> topics = Topic.findAllByCreatedBy(session.user)
        render(topics.name)
    }


    //need to specify the user to whom we are going to do this subscribe operation
    def join(Long id)
    {
        Topic topic=Topic.findById(id)
        Subscription subscription = new Subscription(topic: topic , user: user, seriousness: Seriousness.SERIOUS)

        if (subscription.validate())
        {
            subscription.save()
            flash.message="Subscribed for the topic successfully"

        }

        else
        {
            flash.error="Error while subscribing for the topic"

        }
    }



    def invite()
    {
        Topic topic1 = Topic.findById(params.topic)

        if (topic1 && User.findByEmail(params.to))
        {

            EmailDTO emailDTO = new EmailDTO(to: params.to, subject:"INVITATION" ,from:"linksharing1@gmail.com" , linkId: topic1.id , content: "Please subscribe for the Topic")

            sendMailService.sendInvitation(emailDTO)
            flash.message = "Invitation Send"
            redirect(controller: 'user', action: 'index')


        }
        else
        {
            flash.error= "Error while inviting user"
            redirect(controller: 'user', action: 'index')
        }
    }

}
