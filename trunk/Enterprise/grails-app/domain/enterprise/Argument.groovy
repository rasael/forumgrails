package enterprise

class Argument {
    
    String name
    static hasMany = [threads:Thread]
    static belongsTo = [course:Course]
    static transients = ['postsCount','courseID']
    // Validation
    static constrains = {
        name blank:false, size:3..100,nullable:false
    }
    
    int getPostsCount(){
        int tot = 0;
        threads.each{
            tot += it.posts.size();
        }
        return tot;
    }
    
    int getCourseID(){
        for(Course c : Course.list()){
            if(c.arguments.contains(this)){
                return c.id
            }
        } 
        return -1
    }
}
