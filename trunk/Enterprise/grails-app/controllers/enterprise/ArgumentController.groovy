package enterprise

class ArgumentController {
    
    static defaultAction = 'show'

    def show(){
        def a = Argument.get(params.id)
        if(a){
            render(view:"show",model:[argument: a])
        }else{
            //            redirect controller: "Course"
            render "CIAO MONDO"
        }
    }
  
    
}