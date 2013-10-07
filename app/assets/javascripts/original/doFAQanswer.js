function doFAQ (myDisplay) {
	divs = document.getElementsByTagName("DIV")
	for (i = 0; i < divs.length; i++)
	if (divs[i].id.search(/^answer_/) != -1)
	doAnswer(divs[i].id.replace(/answer_/, ""))
}

// SHOW / HIDE SPECIFIC ANSWER
function doAnswer (myID) {
	myQuestionObject = document.getElementById("question_" + myID)
	myAnswerObject = document.getElementById("answer_" + myID)
	if (myAnswerObject.style.display == "none") {
		myQuestionObject.className = "question open"
		myAnswerObject.style.display = ""
	}
	else {
		myQuestionObject.className = "question closed"
		myAnswerObject.style.display = "none"
	}
} 