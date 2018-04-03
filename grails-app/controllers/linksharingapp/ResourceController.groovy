package linksharingapp

class ResourceController {

    def index() { }

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
