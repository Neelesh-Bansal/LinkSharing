package linksharingapp

class LinkResourceController {

    def index() { }


    def save(String link, String des,String topic){
//        List query = topic.tokenize("=")
//        String topic2 = query[1]
        Topic topic1 = Topic.findByNameAndCreatedBy(topic,session.user)
        Resource resource = new LinkResource(url: link,description: des,topic: topic1,createdBy: session.user)
        if(resource.save()){
            render("Save")
        }
        else{
            render("Not Saved")
        }
    }
}
