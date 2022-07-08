
document.querySelectorAll("#open_notice").forEach(element => element.addEventListener("click", () => {
	document.querySelector("#notice_modal").style.display = "flex";
	document.querySelector("#faq_modal").style.display = "none";
	document.querySelector("#qna_modal").style.display = "none";
        }));

document.querySelectorAll("#open_faq").forEach(element => element.addEventListener("click", () => {
	document.querySelector("#notice_modal").style.display = "none";
	document.querySelector("#faq_modal").style.display = "flex";
	document.querySelector("#qna_modal").style.display = "none";
        }));

document.querySelectorAll("#open_qna").forEach(element => element.addEventListener("click", () => {
	document.querySelector("#notice_modal").style.display = "none";
	document.querySelector("#faq_modal").style.display = "none";
	document.querySelector("#qna_modal").style.display = "flex";
        }));


/*document.querySelectorAll(".close").forEach(element => element.addEventListener("click", () => {
	document.querySelector(".modal-background").style.display = "none";
        }));*/


