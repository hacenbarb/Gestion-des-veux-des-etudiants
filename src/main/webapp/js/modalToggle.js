const deleteButtons = document.querySelectorAll(".detele-button")
const annulerButton = document.querySelector(".annuler-button")
const deleteModal = document.querySelector(".delete-modal")
//
//deleteButtons.forEach(el=>{
//    el.addEventListener("click",()=>{
//        deleteModal.style.display = "block"
//    })
//})
annulerButton.addEventListener("click", () => {
	console.log("modal annuler has clicked!")
	deleteModal.style.display = "none"
})
