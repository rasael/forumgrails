package enterprise

class PostController {

    def doAdd() {

        if(!params.threadID){
            flash.message = "Invalid thread parameters"
            redirect controller:"Course", action:"list"
            return;
        }

        Thread arg = Thread.get(params.threadID)

        if(params.text && params.text.trim().length() >= 3){

            Post p = new Post(text:params.text,author:session.user)
            if(arg && p){
                arg.addToPosts(p)
                arg.save()
                redirect controller:"Thread",action:"show", id:arg.id
                return;
            }
            flash.message = "An error occurred creating the post"
            forward action:"add",params:[course:course,title:params.title]
            return
        }

        flash.message = "Invalid post title"
        forward action:"add",params:[id:arg.id,text:params.text]

    }
    def add(){
        if(!params.id){
            flash.message = "Invalid Thread ID"
            redirect controller:"Course", action:"list"
            return;
        }
        render view:"add", model:[thread:Thread.get(params.id)]
    }


    def remove(){

        Post p = Post.get(params.id)

        if(p){
            int argID = t.getArgumentID()
            Thread.get(argID).removeFromPosts(p)
            p.delete()
            redirect controller:"Thread",view:"show",id:argID
        }else{
            flash.message = "An error occurred while deleting a post"
            redirect controller:"Course",view:"list"
        }
    }



    //def scaffold = Post
}
