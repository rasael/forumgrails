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
        render view:"list"
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
