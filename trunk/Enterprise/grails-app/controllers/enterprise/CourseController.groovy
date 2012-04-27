package enterprise


class CourseController {

    //    def scaffold = Course
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
        Course c = new Course(name:params.name)
        c.save()
        if(c){
            c.save()
            redirect action:"show",params:[id:c.id]
        }else{
            redirect action:"add",params:[name:params.name]
        }
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
