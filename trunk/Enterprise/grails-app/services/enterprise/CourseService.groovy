package enterprise

class CourseService {

    static expose = ['cxf']
    
    Course[] getCourses() {
        Course.list() as Course[]
    }
}
