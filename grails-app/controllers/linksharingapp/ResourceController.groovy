package linksharingapp

import linksharingapp.co.ResourceSearchCO
import linksharingapp.co.SearchCO
import linksharingapp.enumeration.Visibility
import linksharingapp.vo.RatingInfoVO
import linksharingapp.vo.TopicVO

class ResourceController {

    def index() { }


    //Q24 Plugin
    def save(Long id,String des){
        println(id)
        println("In resource edit mode")
        Resource resource = Resource.findById(id)
        println(resource)
        Resource.withNewTransaction {
            if (resource) {
                println("Inside Saving")
                Resource.executeUpdate("update Resource set description=:des where id=:id", [des: des, id: id])
                flash.message = "Description edit successfully"
                redirect(controller: 'user', action: 'index')
            } else {
                flash.error = "post not found"
                redirect(controller: 'user', action: 'index')
            }
        }
    }


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
//        RatingInfoVO ratingInfoVO= resource.setRatingInfoVO(resource)
//        render("Total Votes--${ratingInfoVO.totalVotes}")
//        render("Average Score--${ratingInfoVO.averageScore}")
//        render("Total Score--${ratingInfoVO.totalScore}")
        if(session.user && resource.canViewBy(session.user)){
            String resourceType = Resource.findTypeOfResource(id)
            render(view: '',model: [resource:resource,resourceType : resourceType])
        }
        else if(resource.topic.isPublic()){
            String resourceType = Resource.findTypeOfResource(id)
            render(view: '/resource/show',model: [resource:resource,resourceType : resourceType])
        }
        else {
            flash.error = "User cannot view this resource"
            redirect(controller: 'login',action: 'index')
        }

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
        if(session.user) {
            Resource resource = Resource.get(id)
            if (resource.delete()) {
                flash.message = "Resource deleted successfully"
                render(controller: 'login', action: 'index')
            } else {
                flash.error = "Resource not found"
                render(controller: 'login', action: 'index')
            }
        }
        else {
            flash.error = "Please login to perform action"
            render(controller: 'login', action: 'index')
        }

    }
}
