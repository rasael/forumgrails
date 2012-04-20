package enterprise


class CourseController {

    //    def scaffold = Course
    static defaultAction = 'list'
    
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
}
