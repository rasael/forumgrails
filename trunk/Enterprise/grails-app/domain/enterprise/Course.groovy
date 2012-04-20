package enterprise

class Course {

    String name
    List arguments
    
    static hasMany = [arguments:Argument]

    static transients = ['threadsCount','getPostsCount']
    
    int getThreadsCount(){
        int tot = 0;
        arguments.each{
            tot += it.threads.size();
        }
        return tot;
    }
    
    int getPostsCount(){
        int tot = 0;
        arguments.each{
            tot += it.getPostsCount();
        }
        return tot;
    }
    
}
