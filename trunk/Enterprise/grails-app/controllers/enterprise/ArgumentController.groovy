package enterprise

class ArgumentController {
    
    static defaultAction = 'show'
    
    // Authentication interceptor
    def beforeInterceptor = [action:this.&checkUser,except:['list','show']]
    
    def show(){
        def a = Argument.get(params.id)
        if(a){
            render(view:"show",model:[argument: a])
        }else{
            flash.message = "Invalid Argument ID, you have been redirected to the Course list";
            redirect controller: "Course"
        }
    }
    
    def doAdd() {
        
        if(!params.courseID){
            log.println("ArgumentController.doAdd :: invalid course ID")
            flash.message = "Invalid argument parameters"
            redirect controller:"Course", action:"list"
            return;
        }
        
        Course course = Course.get(params.courseID)
        log.println("ArgumentController.doAdd :: Saving new argument with params $params");
        
        if(params.name && params.name.trim().length() >= 3){
            
            Argument arg = new Argument(name:params.name)            
            if(arg && course){
                log.println("ArgumentController.doAdd :: Adding new argument $arg")
                course.addToArguments(arg)
                course.save()
                redirect controller:"Course",action:"show",params:[id:course.id]
                return;
            }
            flash.message = "An error occurred creating the argument"
            redirect action:"add",params:[course:course,name:params.name]
            return
        }

        log.println("ArgumentController.doAdd :: invalid argument name")
        flash.message = "Invalid argument name"
        redirect action:"add",params:[id:course.id,name:params.name]
        
    }
    
    def add(){
        if(!params.id){
            flash.message = "Invalid Course ID"
            redirect controller:"Course", action:"list"
            return;
        }
        render view:"add", model:[course:Course.get(params.id)]
    }
    
    def remove(){
        Argument arg = Argument.get(params.id)
        int courseID = arg.getCourseID()
        Course.get(courseID).removeFromArguments(arg);
        
        if(arg){
            arg.delete()
        }
        
        redirect controller:"Course",action:"show",params:[id:courseID]
        
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