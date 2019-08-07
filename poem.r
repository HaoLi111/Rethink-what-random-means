
MW_spring = "Synonyms and Antonyms of spring
1
an act of leaping into the air 
the deer gave a sudden spring and disappeared into the woods
Synonyms of spring 
bound, hop, jump, leap, vault
Words Related to spring 
bounce, lope, skip
caper, capriole, gambado, gambol
attack, pounce
dive, pitch, plunge
2
a point or place at which something is invented or provided 
the springs of this time-honored tradition run too deep to allow for easy explanation
Synonyms of spring 
cradle, font, fountain, fountainhead, origin, root, seedbed, source, well, wellspring
Words Related to spring 
beginning, commencement, dawn, day one, genesis, get-go (also git-go), inception, incipience, incipiency, kickoff, launch, morning, nascence, nascency, onset, outset, start, threshold
baseline, first base, ground zero, square one"

#https://www.merriam-webster.com/thesaurus/spring
library(stringr)
makePoem = function(string = MW_spring,nrows=4,nmax=4){
	poem = c()
      string = str_replace_all(string, "[\r\n]"," ")
	#str_replace_all(string, "[\n]"," ")
	vocabulary = strsplit(string," ")[[1]]
	for(i in 1:nrows){
	nlength = ceiling(runif(1,0,nmax))
	phase = ""
	for(j in 1:nlength){
	phase = paste(phase,sample(vocabulary,1,replace = F))

	}
	poem = c(poem,phase)
	}

	class(poem) = "poem"
      poem
}

print.poem = function(x)  for(i in seq_along(x)) print(x[i])


makePoem()

