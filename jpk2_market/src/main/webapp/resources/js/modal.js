/*const loremIpsum = document.getElementById("lorem-ipsum")
fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
    .then(response => response.text())
    .then(result => loremIpsum.innerHTML = result)
const modal = document.getElementById("modal")

function modalOn() {
    modal.style.display = "flex"
}
function isModalOn() {
    return modal.style.display === "flex"
}
function modalOff() {
    modal.style.display = "none"
}
const btnModal = document.getElementById("btn-modal")
btnModal.addEventListener("click", modalOn);
    

const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", modalOff);
    
    
modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modalOff()
    }
})
window.addEventListener("keyup", e => {
    if(isModalOn() && e.key === "Escape") {
        modalOff()
    }    
})*/




document.querySelectorAll(".open").forEach(element => element.addEventListener("click", () => {
	document.querySelector(".modal-background").style.display = "flex";
	document.documentElement.style.overflow = "hidden";	//html태그를 의미
	document.documentElement.style.position= "fix";
	document.documentElement.style.height = "";
	document.body.style.position= "fix";
	document.body.style.overflow = "hidden";	//body태그를 의미
	document.body.style.height = "";
	
	
	
        }));
document.querySelectorAll(".close").forEach(element => element.addEventListener("click", () => {
	document.querySelector(".modal-background").style.display = "none";
	document.documentElement.style.overflow = "";
	document.documentElement.style.height = "";
	document.body.style.overflow = "";
	document.body.style.height = "";
        }));

