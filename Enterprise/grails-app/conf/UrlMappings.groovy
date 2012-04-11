class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        // code lines to change the default homepage
        // in this way, we will see the default action of CourseController (index)
        "/"{
            controller = 'Course'
        }

		// "/"(view:"/index")
		"500"(view:'/error')
	}
}
