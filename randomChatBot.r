chatBot = function(answers = c("Uh-Huh","I suppose you are right.","Yeah, Maybe.","Look, I don't understand you but you are a genious!")){
message("Please Enter a Nickname:")
nickName =readline()
message("Hello what's up?")
for(i in 1:400){
	message(paste(nickName,":"))
	a = readline()
	if(a=="I had enough!"){
		return()
	}
	r = runif(1,1e-5,length(answers))
	message("Randombot:")
	message(answers[ceiling(r)])
}
}

more_complexed_answers = c("Maybe there is a way out.","This does not solve the problem.","I knew...")

opinions = c("You can say it again.","I'm with you.","well... I think there's a clever way of doing that.",
"I did't get it")

chatBot()