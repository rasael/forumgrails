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
        log.println("\n\nSaving new course with params $params \n\n");
        Thread t = new Thread(name:params.name)
        t.save()
        if(t){
            t.save()
            redirect action:"show",params:[id:t.id]
        }else{
            redirect action:"add",params:[name:params.name]
        }
    }
    
    def add(){
        render view:"add"
    }
    
    def remove(){
        def t = Thread.get(params.id)
        if(t){
            t.delete()
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
