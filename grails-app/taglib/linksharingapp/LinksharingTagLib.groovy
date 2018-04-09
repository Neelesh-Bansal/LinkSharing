package linksharingapp

import linksharingapp.vo.TopicVO

class LinksharingTagLib {
    static defaultEncodeAs = "raw"
    static namespace = "ls"

    def checkRead = { attrs,body ->
        def value;
        Boolean aBoolean = new Boolean(attrs.isRead)
        if(session.user){
            if(aBoolean){
                value = "Mark as Read"
            }else {
                value = "Mark as Unread"
            }
        }
        else {
            value = null
        }

        out << body() << value
    }

    def trendingTopics = {
        List<TopicVO> topiclist = Topic.getTrendingTopics()
        out <<g.render(template: '/topic/showTrendingTopics',collection: topiclist,var: "demo3")
    }


    def topPost = {
        List<Resource> resourcesList = Resource.topPost()
        out<< g.render(template: '/login/showTopPost', collection: resourcesList, var: "demo" )
    }
//
//    def canDeleteResource = {
//
//    }

    def showSubscribe = {attrs,body ->
        def value
        if (attrs.topicId && session.user){
            value = "delete"
        }else {
            value = "save"
        }
        out << body() << value
    }

    def subscriptionCount = { attrs,body ->
        if(session.user && attrs.topicId){
            Topic topic = Topic.findById(attrs.topicId.toLong())
            out << body() << topic.subscriptions.size()
        }
        else if (session.user){
            out << body() << session.user.subscriptions.size()
        }
    }


    def resourceCount = {attrs,body ->
        List<Resource> resources = Resource.findAllByTopic(attrs.topicId.toLong())
        out << body() << resources.size()
    }

    def topicCount = {attrs,body ->
        out << body() << session.user.topics.size()
    }
    
}
