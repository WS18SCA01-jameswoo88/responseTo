/*
struct MyQuestionAnswerer { //think of it as a class for now..
    /*
    func responseTo(question: String) -> String {
        // TODO: Write a response 
        return "?"
    }
 	
    
    func responseTo(question: String) -> String {
        
        if question.hasPrefix("hello") {
            return "Why, hello there"
        } else if question.hasPrefix("where") {
            return "To the North!"
        } else if question.hasPrefix("how") {
            return "By any means necessary!"
        } else {
            return "That really depends"
        }
    }
    */
    
    var previous: String = "";
    
    mutating func responseTo(question: String) -> String {
        let defaults: [String] = [ //creating an instance of an array of strings
            "Stop asking you fool!",
            "I don't know..",
            "Please ask again tomorrow"
        ]
        let lowerQuestion: String = question.lowercased();
        
        if lowerQuestion == "Where are the cookies?" {
            return "In the cookie jar!"
        }
        else if lowerQuestion.hasPrefix("hello") {
            if previous == "Why, hello there!" {
                previous = "What's up?"
                return previous
            } else {
                previous = "Why, hello there!"
                return previous
            }
        }
        else if lowerQuestion.hasPrefix("where") {
            return "To the North!"
        }
        else if lowerQuestion.hasPrefix("can") {
            return "I don't know. Can you?"
        }
        else if lowerQuestion.hasPrefix("should") {
            return "Yes, you should"
        }
        else {
            let n = lowerQuestion.count % defaults.count //this give you 3 possible random values
            /*
             if n == 0 {
             return "Stop asking you fool!"
             } else if n == 1 {
             return "I don't know.."
             } else {
             return"Please ask again tomorrow"
             }
             */
            return defaults[n] //PRACTICE USING AN ARRAY FOR MULTIPLE IF STATEMENTS!!!
        }
    }
    
    
    var count: Int = 0;  //count how many questions the user has asked
    var seenCats: Bool = false;   //true if the user has asked any question that mentions cats
    
    mutating func responseTo1(question: String) -> String {
        // TODO: Write a response
        count += 1
        print(count)
        if count > 3 {
            return "I find myself growing fatigued."
        }
        return "?"
    }
}
*/

struct MyQuestionAnswerer {
    
    let dislikes: [String] = [
        "cats",
        "coconut",
        "shrimp",
        "lobster",
        "shellfish",
        
        ];
    
    let likes: [String] = [
        "chinese food",
        "bicycle",
        "stanley kubrick",
        "alfred hitchcock",
        "astronomy",
        "cartography"
    ];
    
    
    var count: Int = 0;  //count how many questions the user has asked
    var seenDogs: Bool = false;   //true if the user has asked any question that mentions cats
    var lastQuestion: String = ""; //the most recent question
    var lastResponse: String = ""; //the most recent response
    
    mutating func responseTo(question: String) -> String {
        let lowercaseQuestion: String = question.lowercased();
        
        count += 1
        print(count)
        
        if lastQuestion == lowercaseQuestion {
        	return "You just asked that!"
        } else {
        	if count > 10 && count <= 15 {
            	return "You've already asked \(count - 1) questions. Leave me alone."
        	} else {
                lastQuestion = lowercaseQuestion
        		if lowercaseQuestion.range(of: "dogs") != nil {
                	seenDogs = true
                	return "Let's go back and talk some more about dogs"
            	}
            	for dislike in dislikes {
                	if lowercaseQuestion.range(of: dislike) != nil {
                    	return "I detest \(dislike).  You've touched a raw nerve there."
                    	}
                	}
        
            	for like in likes {
                	if lowercaseQuestion.range(of: like) != nil {
                    	return "I like \(like)."
                	}
            	}
        		return "I have no strong opinion.";
        	}
        }

    }
    
}
