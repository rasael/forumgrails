package enterprise

class CourseService {

    static expose = ['cxf']
  
    boolean hasCourses() {
        return !course.list.isEmpty()
    }
    
    boolean addUser(String name) {
        User user = new User(email:name + "@supsi.ch",password:"forumpassword",role:UserRole.Moderator)
        user.save()
        return user
    }
}
