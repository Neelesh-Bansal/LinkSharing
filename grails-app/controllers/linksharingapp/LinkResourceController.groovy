package linksharingapp

class LinkResourceController {

    def index() { }


    def save(String link, String des,Long topic){
//        List query = topic.tokenize("=")
//        String topic2 = query[1]
        if(session.user){
        Topic topic1 = Topic.findById(topic)
        println("(((((((((((((()))))))))))))))))")
        println(topic1)
        Resource resource = new LinkResource(url: link,description: des,topic: topic1,createdBy: session.user)
        println(resource)
        if(resource.save()){
            render("Save")
        }
        else{
            render("Not Saved")
        }
      }
        else{
            flash.error = "Login to continue"
            render(controller: 'login', action: 'index')
        }
    }
}
