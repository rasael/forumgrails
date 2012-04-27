package enterprise

class UserController {

    def login() { }
    
    def doLogin() {
        def user = User.findWhere(email:params["email"],password:params["password"])
        session.user = user
        if(user){
            redirect(controller:"Course",action:"add")
        }else{
            redirect(controller:"user",action:"login",params:[email:params["email"]])
        }
    }
    
    def logout(){
        session.user = null
        redirect(controller:"Course",action:"list")
    }
}
