package linksharingapp

import linksharingapp.co.ResourceSearchCO
import linksharingapp.enumeration.Visibility
import linksharingapp.vo.RatingInfoVO
import linksharingapp.vo.TopicVO

class ResourceController {

    def index() { }


    def showTopPost(){
       List<Resource> resources = Resource.topPost()
        render("Top Post --- ${resources.id}")
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


    def search(){
        ResourceSearchCO resourceSearchCO=new ResourceSearchCO()
        if(resourceSearchCO.q)
            resourceSearchCO.visibility=Visibility.PUBLIC


        List<Resource> resources = Resource.search(resourceSearchCO).list()
        render(resources.createdBy.firstName)
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
