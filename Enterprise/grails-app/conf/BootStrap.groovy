import enterprise.*

class BootStrap {

    def init = { servletContext ->
        
        // Create sample objects
        if(!Argument.count()){
            log.println("Argument count is empty, creating sample objects");

            Post post1 = new Post(text:"Sample post number one")
            post1.addToVotes(new Vote(value:1))
            post1.addToVotes(new Vote(value:4))
            post1.addToVotes(new Vote(value:10))
            
            Post post2 = new Post(text:"Sample post number one")
            post2.addToVotes(new Vote(value:5))

            Thread thread1 = new Thread(title:"Progetto grails",text:"Situazione del progetto")
            thread1.addToPosts(post1)
            thread1.addToPosts(post2)

            Argument arg1 = new Argument(name:'Groovy')
            arg1.addToThreads(thread1)
            
            Course course1 = new Course(name:'Applicativi Enterprise')
            course1.addToArguments(arg1)
            course1.addToArguments(new Argument(name:'Grails'))
            course1.save()
            
            
            Post post3 = new Post(text:"Sample post number three")
            post3.addToVotes(new Vote(value:5))
            

            Thread thread2 = new Thread(title:"Travelling Salesman Problem",text:"TSP Challenge Cup")
            thread2.addToPosts(post3)

            Argument arg2 = new Argument(name:'Metaeuristiche')
            arg1.addToThreads(thread2)
            
            Course course2 = new Course(name:'Algoritmi avanzati')
            course2.addToArguments(arg2)
            course2.addToArguments(new Argument(name:'Giochi a due giocatori'))
            course2.save()
            
        }
    }
    def destroy = {
    }
}
