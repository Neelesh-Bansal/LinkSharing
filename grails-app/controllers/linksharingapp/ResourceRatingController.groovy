package linksharingapp

class ResourceRatingController {

    def index() {}

    def save() {
        if (session.user) {
            Resource resource = Resource.findById(params.id.toLong())
            Integer score = new Integer(params.rating)
            if (ResourceRating.findByUserAndResource(session.user, resource)) {
                flash.error = "You already voted this resource"
                redirect(controller: 'login', action: 'index')
            } else {
                ResourceRating resourceRating = new ResourceRating(user: session.user, resource: resource, score: score)
                resourceRating.save()
                redirect(controller: 'login', action: 'index')
            }
        } else {
            flash.error = "Not Logged In"
            redirect(controller: 'login', action: 'index')
        }
    }
}
