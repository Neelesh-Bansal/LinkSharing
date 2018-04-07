package linksharingapp

import linksharingapp.co.ResourceSearchCO
import linksharingapp.co.SearchCO
import linksharingapp.enumeration.Visibility
import linksharingapp.vo.RatingInfoVO
import linksharingapp.vo.TopicVO

class ResourceController {

    def index() { }


    def showUnread(){
        SearchCO searchCO = new SearchCO(q: "Topic0",max: 5,offset: 0)
        List<Resource> resources = User.getUnReadResources(searchCO)
        render("Unread Resouces-- ${resources.id}")
    }


    def showTopPost(){
       List<Resource> resources = Resource.topPost()
        render(view: '/login/index', model: [resourceList:resources])
    }

    def showRecentShares(){
        List<Resource> resources = Resource.recentShares()
        render(resources)
    }


def show2(){
    List<TopicVO> topicVOList = Topic.getTrendingTopics()
    render("Top 5 Trending topics--${topicVOList.toString()}\n")

}

    def show(Long id){
        Resource resource=Resource.get(id)
        RatingInfoVO ratingInfoVO= resource.setRatingInfoVO(resource)
        render("Total Votes--${ratingInfoVO.totalVotes}")
        render("Average Score--${ratingInfoVO.averageScore}")
        render("Total Score--${ratingInfoVO.totalScore}")

    }

      //Search resource functionality
    def search(String key) {
        println("Inside search")
        Topic topic = Topic.findByName(key)
        println(topic)
        if (topic){
            SearchCO co = new ResourceSearchCO()
            co.topicId=topic.id
            co.q = topic.visibility
            if(co.q){
                co.setVisibility(topic.visibility)
            }
            List<Resource> resources = Resource.search(co).list()
            render(view: '/resource/search',model: [resourceList:resources])

        }
        else {
            flash.error = "Resource not found... Try Again!!"
            redirect(controller : 'login' , action : 'index')
        }
    }




    def delete(Long id){
        Resource resource = Resource.read(id)
        try {
            println(resource.delete())
            render("Resource deleted successfully")
        }
        catch (RuntimeException ex){
            render("Resource not found")
        }

    }
}
