package enterprise

class ThreadController {

    //    def scaffold = Course
    static defaultAction = 'list'
    
    // Authentication interceptor
    def beforeInterceptor = [action:this.&checkUser,except:['list','show']]
    
    def list(){
        render view:"list"
    }
    
    // Single item view
    def show(){

        def t = Thread.get(params.id)
        if(t){
            render(view:"show",model:[thread: t])
        }else{
            redirect action:"list"
        }
    }
    
    def doAdd() {
        
        if(!params.argumentID){
            flash.message = "Invalid thread parameters"
            redirect controller:"Course", action:"list"
            return;
        }
        
        Argument arg = Argument.get(params.argumentID)
        
        if(params.title && params.title.trim().length() >= 3 && params.text && params.text.trim().length() >= 3){
            
            Thread t = new Thread(title:params.title,text:params.text,author:session.user)          
            if(arg && t){
                arg.addToThreads(t)
                arg.save()
                redirect controller:"Argument",action:"show",params:[id:arg.id]
                return;
            }
            flash.message = "An error occurred creating the argument"
            redirect action:"add",params:[course:course,title:params.title]
            return
        }
        flash.message = "Invalid argument name"
        redirect action:"add",params:[id:course.id,title:params.title]
        
    }
    def add(){
        if(!params.id){
            flash.message = "Invalid Argument ID"
            redirect controller:"Course", action:"list"
            return;
        }
        render view:"add", model:[argument:Argument.get(params.id)]
    }
     
        
    def remove(){
        
        Thread t = Thread.get(params.id)

        if(t){ 
            int argID = t.getArgumentID()
            Argument.get(argID).removeFromThreads(t)
            t.delete()
            redirect controller:"Argument",view:"show",model:[id:argID]
        }else{
            flash.message = "An error occurred while delete a thread"
            redirect controller:"Course",view:"list"
        }
        
        
    }
    
    // Check the user authentication
    def checkUser() {
        if(!session.user){
            // User not logged in or session timed out
            redirect(controller:"user",action:"login")
            return false
        }
    }
}
