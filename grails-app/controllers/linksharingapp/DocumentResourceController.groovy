package linksharingapp

class DocumentResourceController {

    def index() { }

    def save() {
        println("Inside Document creation")
        User user = session.user
        if (user){
            println("Inside Document creation-->2")
            Topic topic = Topic.findById(params.topicId)
            DocumentResource documentResource = new DocumentResource(filePath:"/home/neelesh/",createdBy: user,description: params.description,topic:topic)


            if(documentResource.save()){
                println("Inside Document creation-->3")
                def file1 = request.getFile('document')
                file1.transferTo(new java.io.File("/home/neelesh/${documentResource.id}.pdf"))
                flash.message = "DcoumentResource saved successfully"
                redirect(controller:'user',action : 'index')
            }
            else {
                println(documentResource.errors.allErrors)
                flash.error = "DocumentResource not saved"
                redirect(controller: 'user',action: 'index')
            }
        }
    }



    def show(){
        def file = new File("/home/neelesh/${params.id}.pdf")
        def file1 = file.bytes
        response.contentType = '*' // or the appropriate image content type
        response.outputStream << file1
        response.outputStream.flush()
    }
}
