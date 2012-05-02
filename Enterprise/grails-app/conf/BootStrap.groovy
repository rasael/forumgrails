import enterprise.*

class BootStrap {

    def init = { servletContext ->
        
        if(!User.count()){
            
            log.println("[ForumGrails] Creating fake users ...")
            new User(email:"forumgrails@supsi.ch",password:"forumpassword",role:UserRole.Administrator).save()
            new User(email:"forummoderator@supsi.ch",password:"forumpassword",role:UserRole.Moderator).save()
            User usr = new User(email:"forumuser@supsi.ch",password:"forumpassword",role:UserRole.User)
            usr.save()
            User tempuser = new User(email:"marco.bernasconi@supsi.ch",password:"forumpassword",role:UserRole.User)
            tempuser.save()
        new User(email:"ch@ch.ch",password:"123456").save();
        
            // to Debug
            User.list().each{
                log.println("[ForumGrails] User created: $it, ${it.password}, ${it.role}")
            }
            log.println("[ForumGrails] There is a total of ${User.count()} users in the DB.");

            log.println("[ForumGrails] Creating sample objects")

            Post post1 = new Post(text:"Answer to the thread",author:tempuser)
            post1.addToVotes(new Vote(value:1))
            post1.addToVotes(new Vote(value:4))
            post1.addToVotes(new Vote(value:10))
            
            Post post2 = new Post(text:"Sample post number one",author:usr)
            post2.addToVotes(new Vote(value:5))

            Thread thread1 = new Thread(title:"Progetto grails",text:"Situazione del progetto",author:tempuser)
            thread1.addToPosts(post1)
            thread1.addToPosts(post2)
            
            Thread thread2 = new Thread(title:"Second thread",text:"why not?",author:tempuser)
            thread2.addToPosts(new Post(text:"First post in second thread",author:tempuser))
            

            Argument arg1 = new Argument(name:'Groovy')
            arg1.addToThreads(thread1)
            arg1.addToThreads(thread2)
            
            Course course1 = new Course(name:'Applicativi Enterprise')
            course1.addToArguments(arg1)
            course1.addToArguments(new Argument(name:'Grails'))
            course1.save()
            
            
            Post post3 = new Post(text:"Sample post number three",author:usr)
            post3.addToVotes(new Vote(value:5))
            

            Thread thread3 = new Thread(title:"Travelling Salesman Problem",text:"TSP Challenge Cup",author:tempuser)
            thread3.addToPosts(post3)

            Argument arg2 = new Argument(name:'Metaeuristiche')
            arg2.addToThreads(thread3)
            
            Course course2 = new Course(name:'Algoritmi avanzati')
            course2.addToArguments(arg2)
            course2.addToArguments(new Argument(name:'Giochi a due giocatori'))
            course2.save()
            
            
            log.println("[ForumGrails] There is a total of ${Argument.count()} arguments in the DB.");            
        }
        
        
    }
    def destroy = {
    }
}
