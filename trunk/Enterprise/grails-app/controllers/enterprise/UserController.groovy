package enterprise

class UserController {

    def login() { }
    
    def doLogin() {
        def user = User.findWhere(email:params["email"],password:params["password"])
        session.user = user
        if(user){
            def path = params.ref.substring(params.ref.indexOf(request.getContextPath())+request.getContextPath().length());
            redirect(url:path)
        }else{
            flash.message = "Login errato"
            redirect(controller:"user",action:"login",params:[email:params["email"]])
        }
    }
    
    def logout(){
        session.user = null
        String fullURL = request.getRequestURL().append("?").append( 
            request.getQueryString()).toString();
        log.println("fullURL :: " + fullURL)
        redirect(url:fullURL)
    }
}
