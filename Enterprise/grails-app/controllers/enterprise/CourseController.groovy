package enterprise


class CourseController {

    static defaultAction = 'list'
    
    // Authentication interceptor
    def beforeInterceptor = [action:this.&checkUser,except:['list','show']]
    
    def list(){
        render view:"list"
    }
    
    // Single item view
    def show(){

        def c = Course.get(params.id)
        if(c){
            render(view:"show",model:[course: c])
        }else{
            redirect action:"list"
        }
    }
    
    def doAdd() {
        log.println("\n\nSaving new course with params $params \n\n");
        if(params.name && params.name.trim().length() >= 3){
            
            Course c = new Course(name:params.name)
            if(c){
                c.save()                
                redirect action:"show",params:[id:c.id]
                return;
            }
        }
        flash.message = "Invalid course name";
        redirect action:"add",params:[name:params.name]
        
    }
    
    def add(){
        render view:"add"
    }
    
    def remove(){
        def c = Course.get(params.id)
        if(c){
            c.delete()
        }
        render view:"list"
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
