package linksharingapp

import linksharingapp.co.SearchCO
import linksharingapp.enumeration.Visibility
import linksharingapp.vo.TopicVO

class UserController {

    def assetResourceLocator
    UserService userService
    def index() {
        if(session.user) {
            List<TopicVO> topicVOList = Topic.getTrendingTopics()
            User user = User.findById(session.user.id)
            def max = params.max?:5
            def offset = params.offset?:0
            def unReadItems = ReadingItem.createCriteria().list(max: max,offset: offset){
                eq("user",user)
            }
            println(unReadItems)

            println("-----")

            println(unReadItems.getTotalCount())
            render(view: '/user/dashboard', model: [topicList: topicVOList,unReadItems:unReadItems,total:unReadItems.getTotalCount()])

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
        println("Inside profile update-->")
        User.withNewTransaction {
                User user = session.user
                Long id = user.id
                User.executeUpdate("update User set firstName=:fname,lastName=:lname,username=:uname where id=:id", [fname: fname,lname:lname,uname:uname, id: id])
                session.user = User.findById(id)
                flash.message="Profile Edit successfully"
                redirect(controller: 'user',action: 'index')
            }
    }

    //used for updating current session user password
    def changePassword(String pass1, String pass2){
        User.withNewTransaction {
            if (pass1.equals(pass2)) {
                User user = User.find(session.user)
                Long id = user.id
                User.executeUpdate("update User set password=:pass where id=:id", [pass: pass1, id: id])
                flash.message="Password Changed successfully"
                redirect(controller: 'user',action: 'index')
            }
            else{
                flash.error="password not matching"
                redirect(controller: 'user',action: 'index')
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

    def state(){
        println(params.id)
        params.id
        if(userService.changeState(new Integer(params.id))){
            flash.message = "state changed"
            redirect(controller: 'user',action: 'index')
        }
        else{
            flash.error = "state not changed"
            redirect(controller: 'user',action: 'index')
        }
    }

}
