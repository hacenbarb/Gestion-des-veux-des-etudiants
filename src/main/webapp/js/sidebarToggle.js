const sidebarButton = document.querySelector("#sidebarToggler")
const sidebar = document.querySelector("aside")
function handleSidebar() {
    sidebar.classList.toggle("hidden")
    document.querySelector(".wrapper").classList.toggle("expanded")
}
sidebarButton.addEventListener("click",()=>{handleSidebar()})
