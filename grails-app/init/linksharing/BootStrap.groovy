package linksharing

import enumeration.Seriousness
import enumeration.Visibility
import grails.util.Holders
import linksharingapp.DocumentResource
import linksharingapp.LinkResource
import linksharingapp.ReadingItem
import linksharingapp.Resource
import linksharingapp.ResourceRating
import linksharingapp.Subscription
import linksharingapp.User
import linksharingapp.Topic
import Constants.DefaultPassword


class BootStrap {

    def init = { servletContext ->

        log.info("**********************************************")
        println(Holders.grailsApplication.config.server.contextPath)

        if(User.count()==0) {
            createUsers()
        }
        createTopics()

        if(Resource.count()==0) {
            createResources()
        }
        subscribeTopics()
        createReadingItems()
        createResourceRatings()

    }

    void createResourceRatings(){
        //Add rating for all the unread reading items of the user
        List<User> users = User.findAll()
        users.each {
            User user = it
            List<ReadingItem> readingItems = ReadingItem.findAllByIsReadAndUser(false,user)
            readingItems.each {
                Resource resource = it.resource
                ResourceRating resourceRating = new ResourceRating(user: user,resource: resource,score: 3)
                println(resourceRating.save())
            }
        }

    }

    void createReadingItems(){
        List<User> users = User.getAll()

        users.each {
            User user = it
            List<Topic> topics = Topic.findAllByCreatedByNotEqual(user)
            topics.each {
                Topic topic = it
                List<Resource> resources = Resource.findAllByTopic(topic)
                resources.each {
                    ReadingItem readingItem = new ReadingItem(resource: it,user: user,isRead: false)
                    if(!ReadingItem.findByUserAndResource(user,it))//Reading item of resource should be created only if it does not already exit in users reading item
                    println(readingItem.save())
                }
            }
        }
    }


    void subscribeTopics(){
        List<User> users = User.getAll()
        users.each {
            User user = it
            List<Topic> topics = Topic.findAllByCreatedByNotEqual(user)
            topics.each {
                Subscription subscription = new Subscription(topic: it,user:user,seriousness: Seriousness.VERY_SERIOUS)
                if(subscription.validate()){
                    subscription.save()
                    log.info("User Subscribed Succesfully for the topic which was not created by him/her - $subscription")
                }
                else {
                    log.error(subscription.errors.allErrors)
                }
            }
        }


    }

    void createResources(){
        List<Topic> topics = Topic.findAll()
        topics.each {
            Topic topic = it
            2.times {
                //Creator of the resource should be same as creator of the topic-->createdBy: topic.createdBy
                Resource linkResource = new LinkResource(url: "https://www.google.com",description: "Hello from ${topic.name}",createdBy: topic.createdBy,topic: topic)
                Resource documentResource = new DocumentResource(filePath: "Document${it}", description: "Hello from ${topic.name}",createdBy: topic.createdBy,topic: topic)
                println(linkResource.save())
                if(documentResource.validate()){
                    log.info("documentResource is valid- ${documentResource.validate()}")
                    println(documentResource.save())
                }
                else {
                    log.error(documentResource.hasErrors())
                }
            }
        }
    }

    void createTopics(){
        List<User> users = User.findAll()
        users.each {
            if (!it.topics)
            {
                User user = it
                5.times {
                    Topic topic = new Topic(name: "Topic${it}", visibility: Visibility.PUBLIC, createdby: user)
                        user.addToTopics(topic)
                        println(topic.save())
                  }
                }
            }
        }

    void createUsers() {

        User admin = new User()
        admin.setEmail("neelesh@tothenew.com")
        admin.setFirstName("neelesh")
        admin.setLastName("bansal")
        admin.setPassword(DefaultPassword.defaultPassword)
        admin.setUsername("neeleshbansal")
        admin.setActive(true)
        admin.setAdmin(true)
        if(admin.validate()){
            log.info("Admin is valid- ${admin.validate()}")
            println(admin.save())
        }
        else {
            log.error(admin.hasErrors())
        }


        User normal = new User()
        normal.setEmail("sankalp@tothenew.com")
        normal.setFirstName("sankalp")
        normal.setLastName("jain")
        normal.setPassword("normal12")
        normal.setUsername("jsankalp")
        normal.setActive(true)
        normal.setAdmin(false)
        if(normal.validate()){
            println(normal.save())
           // println(normal.save(failOnError : true,flush : true))
        }
        else {
            log.info("user has errors while validating- ${admin.hasErrors()}")
        }
    }



    def destroy = {
    }
}
