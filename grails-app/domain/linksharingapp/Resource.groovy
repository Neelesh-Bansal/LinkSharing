package linksharingapp

import linksharingapp.co.ResourceSearchCO
import linksharingapp.vo.RatingInfoVO

abstract class Resource {

    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    RatingInfoVO ratingInfoVO

    static belongsTo = [createdBy:User, topic:Topic]

    static hasMany = [ratings:ResourceRating, readingItems:ReadingItem]

    static constraints = {
        description(type: 'text')
    }
    static mapping = {
        topic fetch: 'join'
    }

    static transients = ['ratingInfoVO']

    static namedQueries = {
        search {ResourceSearchCO resourceSearchCO ->
            if (resourceSearchCO.topicId)
                eq('topic.id', resourceSearchCO.topicId)
//            if (resourceSearchCO.visibility)
//                eq('topic.visibility', resourceSearchCO.visibility)
        }
    }

    Integer totalVotes(Resource resource) {
        Integer votes = ResourceRating.createCriteria().count(){

            eq("resource", resource)
        }

        return votes
    }

    Double avgScore(Resource resource) {
        def averageScore = ResourceRating.createCriteria().get{
            projections {
                avg('score')
            }
            eq("resource", resource)
        }

        return averageScore

    }

    Integer totalScore(Resource resource) {
        def score = ResourceRating.createCriteria().get(){

            projections {
                sum('score')
            }
            eq("resource", resource)
        }

        return score
    }

        RatingInfoVO setRatingInfoVO(Resource resource) {
            RatingInfoVO ratingInfoVO = new RatingInfoVO()
            ratingInfoVO.totalVotes = totalVotes(resource)
            ratingInfoVO.averageScore = avgScore(resource)
            ratingInfoVO.totalScore = totalScore(resource)
            return ratingInfoVO
    }


    static List<Resource> topPost(){
        List resources = ResourceRating.createCriteria().list {
            projections {
                property('resource.id')
            }
            groupProperty('resource.id')
            count('resource.id', 'Count')
            order('Count', 'desc')
            maxResults(5)
        }
        List<Resource> resource = Resource.getAll(resources)
        return resource
    }



    static List<Resource> recentShares(){

        List results = Resource.createCriteria().list {
            order("dateCreated", "desc")
            maxResults(2)

        }
        return results
    }


    static String findTypeOfResource(Long id){
        Resource resource = Resource.findById(id)
        if(resource.class == LinkResource.class){
            return "LinkResource"
        }
        else if(resource.class == DocumentResource.class){
            return "DocumentResource"
        }
        else{
            return false
        }
    }

    Boolean canViewBy(User user){
        if (this.topic.canViewedBy(user)){
            return true
        }
        else {
            return false
        }
    }

}
