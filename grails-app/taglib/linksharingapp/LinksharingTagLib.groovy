package linksharingapp

import linksharingapp.vo.TopicVO

class LinksharingTagLib {
    static defaultEncodeAs = "raw"
    static namespace = "ls"

    def checkRead = { attrs, body ->
        def value;
        Boolean aBoolean = new Boolean(attrs.isRead)
        if (session.user) {
            if (aBoolean) {
                value = "Mark as Read"
            } else {
                value = "Mark as Unread"
            }
        } else {
            value = null
        }

        out << body() << value
    }


    def subscribedTopics = {
        User user = session.user
//        List<Subscription> subscriptions = Subscription.findAllByUser(user)
//        List<Topic> topics1 = Topic.findAllBySubscriptionsAndCreatedByNotEqual(subscriptions, session.user)
        // List<Topic> topics2 = Topic.findAllByCreatedBy(session.user)

        List<Subscription> subscriptions = Subscription.findAllByUser(user)
        List<Topic> topicList = []
        subscriptions.each {
            if (it.topic.createdBy.id != user.id) {
                topicList.add(it.topic)
            }
        }
        // List<Topic> topics3=topics1-topics2
        out << g.render(template: '/topic/subscribedTopic', collection: topicList, var: "topicc")
    }

    def topicCreated = {
        List<Topic> topics = Topic.findAllByCreatedBy(session.user)
        out << g.render(template: '/topic/topicCreatedbyUser', collection: topics, var: "topicc")
    }

    def trendingTopics = {
        List<TopicVO> topiclist = Topic.getTrendingTopics()
        out << g.render(template: '/topic/showTrendingTopics', collection: topiclist, var: "demo3")
    }


    def topPost = {
        List<Resource> resourcesList = Resource.topPost()
        out << g.render(template: '/login/showTopPost', collection: resourcesList, var: "demo")
    }

    def canDeleteResource = {

    }

    def showSubscribe = { attrs, body ->
        def value
        if (attrs.topicId && session.user) {
            value = "delete"
        } else {
            value = "save"
        }
        out << body() << value
    }

    def subscriptionCount = { attrs, body ->
        if (attrs.topicId) {
            Topic topic = Topic.findById(attrs.topicId.toLong())
            out << body() << topic.subscriptions.size()
        } else if (attrs.username) {
            User user = User.findByUsername(attrs.username)
            List<Subscription> subscriptions = Subscription.findAllByUser(user)
            out << body() << subscriptions.size()
        }
        else{
            User user = session.user
            List<Subscription> subscriptions = Subscription.findAllByUser(user)
            out << body() << subscriptions.size()
        }
    }


    def resourceCount = { attrs, body ->
        if (attrs.user11) {
            List<Resource> resources1 = Resource.findAllByCreatedBy(attrs.user11)
            //List<Resource> resources = Resource.findAllByTopic(attrs.topicId.toLong())
            out << body() << resources1.size()
        } else if (attrs.id) {
            Topic topic = Topic.findById(attrs.id)
            List<Resource> resources1 = Resource.findAllByTopic(topic)
            //List<Resource> resources = Resource.findAllByTopic(attrs.topicId.toLong())
            out << body() << resources1.size()
        }
        else {
            User user = session.user
            List<Resource> resources1 = Resource.findAllByCreatedBy(user)
            out << body() << resources1.size()
        }
    }

    def topicCount = { attrs, body ->
        out << body() << session.user.topics.size()
    }

    def userImage = { attrs, body ->
        out << "<img src='${createLink(controller: 'user', action: 'fetchUserImage', params: [username: attrs.username])}' " + " height='${attrs.height}' width='${attrs.width}'>"
    }

}
