#This program finds the best hospital in a selected state for a specific condition
#Choices for condition are limited to, "heart attack", "heart failure", or "pneumonia"

best <- function(state = "TX", outcome = "heart attack"){
	out <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
	possible <- c("heart attack", "heart failure", "pneumonia")
	if (state %in% out$State & outcome %in% possible) {
		options(warn=-1)
		outs <- split(out, out[7])
        	st <- outs[[state]]
		if (identical(outcome, "heart attack")){
			outcome <- as.numeric(replace(outcome, values = 11))
		}
		if (identical(outcome, "heart failure")){
			outcome <- as.numeric(replace(outcome, values = 17))
		}
		if (identical(outcome, "pneumonia")){
			outcome <- as.numeric(replace(outcome, values = 23))
		}
		org <- st[order(as.numeric(st[,outcome]), st[,2]), ]
		hosp <- as.character(org[1,2])
		hosp
	} else if (!(state %in% out$State) & outcome %in% possible) {
		stop("Invalid state")
	} else if (state %in% out$State & !(outcome %in% possible)) {
		stop("Invalid outcome")
	} else {
		message("Error in both outcome and State")
	}
}
