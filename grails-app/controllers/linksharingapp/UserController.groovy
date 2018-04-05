package linksharingapp

import linksharingapp.co.SearchCO
import linksharingapp.enumeration.Visibility
import linksharingapp.vo.TopicVO

class UserController {

    def index() {
        List<TopicVO> topicVOList = Topic.getTrendingTopics()
//        List<Topic> topics = User.getSubscribedTopic()
        render (view: '/user/dashboard', model: [topicList:topicVOList])
//        render "User Dahsboard -- "
//        render (session?.user?.username)
    }


    def show(){
        SearchCO searchCO = new SearchCO()
        searchCO.setQ("Topic0")
        searchCO.setMax(10)
        searchCO.setOffset(0)
        render(User?.getUnReadResources(searchCO))

    }

}
