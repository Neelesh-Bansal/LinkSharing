package linksharingapp

class LinkResourceController {

    def index() {}


    def save(String link, String des, Long topic) {
        if (session.user) {
            Topic topic1 = Topic.findById(topic)
            Resource resource = new LinkResource(url: link, description: des, topic: topic1, createdBy: session.user)
            if (resource.save()) {
                render("Save")
            } else {
                render("Not Saved")
            }
        } else {
            flash.error = "Login to continue"
            render(controller: 'login', action: 'index')
        }
    }
}
