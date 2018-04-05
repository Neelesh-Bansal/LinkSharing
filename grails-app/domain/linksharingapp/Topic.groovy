package linksharingapp

import linksharingapp.enumeration.Visibility
import linksharingapp.enumeration.Seriousness
import linksharingapp.vo.TopicVO

class Topic {

    String name
    User createdBy
    static belongsTo = [createdBy:User]
    Date dateCreated
    Date lastUpdated
    Visibility visibility

    static hasMany = [subscriptions:Subscription,resources:Resource]

    static constraints = {
        name(unique: 'createdBy', blank: false, nullable: false)
        visibility(enum: true,nullable: false)
        createdBy(nullable: false)
    }

    static mapping = {
        sort name: 'asc'
        subscriptions fetch: 'join'
    }

    def afterInsert(){
        Topic.withNewSession {
            Subscription subscription = new Subscription(topic: this,user: createdBy, seriousness: Seriousness.VERY_SERIOUS)
            this.addToSubscriptions(subscription)
            subscription.save()
        }
    }


    List<User> getSubscribedUsers(){
        List<User> userList = []
        subscriptions.each {
            userList.add(it.user)
        }
        return userList
    }


    static List<TopicVO> getTrendingTopics(){
        List trendingTopics = Resource.createCriteria().list {
            projections {
                createAlias('topic', 't')
                groupProperty('t.id')
                property('t.name')
                property('t.visibility')
                count('t.id', 'count')
                property('t.createdBy')
            }
            eq('t.visibility',Visibility.PUBLIC)
            order('count', 'desc')
            order('t.name', 'asc')
            maxResults(2)
        }

        List topicVOList = []
        trendingTopics.each {
            topicVOList.add(new TopicVO(id: it[0], name: it[1], visibility: it[2], count: it[3], createdBy: it[4]))
        }
        return topicVOList
    }


    @Override
    public String toString() {
        return "Topic{" +
                "name='" + name + '\'' +
                '}';
    }
}
