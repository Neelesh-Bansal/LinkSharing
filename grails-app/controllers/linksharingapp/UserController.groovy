package linksharingapp

import linksharingapp.co.SearchCO
import linksharingapp.enumeration.Visibility
import linksharingapp.vo.TopicVO

class UserController {

    def assetResourceLocator
    def index() {
        if(session.user) {
            List<TopicVO> topicVOList = Topic.getTrendingTopics()
//        List<Topic> topics = User.getSubscribedTopic()
            render(view: '/user/dashboard', model: [topicList: topicVOList])
        }
        else{
            flash.error = "Login to continue"
            render(controller: 'login', action: 'index')
        }
//        render "User Dahsboard -- "
//        render (session?.user?.username)
    }




    //used in canDeleteResource taglib
    def canDeleteResource(){

    }

    //used for retrieving user profile
    def profile(){
        User user = User.find(session.user)
        render(view: '/user/profile', model: [user:user])
    }

    //used for updating current session user profile
    def update(String fname,String lname, String uname){

    }

    //used for updating current session user password
    def changePassword(String pass1, String pass2){
        User.withNewTransaction {
            if (pass1.equals(pass2)) {
                User user = User.find(session.user)
                Long id = user.id
                User.executeUpdate("update User set password=:pass where id=:id", [pass: pass1, id: id])
            }
        }
    }


    def show(){
        SearchCO searchCO = new SearchCO()
        searchCO.setQ("Topic0")
        searchCO.setMax(10)
        searchCO.setOffset(0)
        render(User?.getUnReadResources(searchCO))

    }

    Boolean isSubscribed(Long topicId){
        Topic topic = Topic.findById(topicId)
        Integer count = Subscription.createCriteria().count{
            eq('user',this)
            eq('topic',topic)
        }
        if(count){
            return true
        }
        else {
            return false
        }
    }



    def fetchUserImage(){
        User user = User.findByUsername(params.username)
        byte[] photo
        if(!user?.photo){
            println("Photo Not Found")
            photo = assetResourceLocator.findAssetForURI('image.jpg').byteArray
        }else {
            println("Photo Found")
            photo= user.photo
        }
        OutputStream out = response.getOutputStream()
        out.write(photo)
        out.flush()
        out.close()
    }

}
