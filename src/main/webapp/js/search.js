'use strict';
// search by id, nom, prenom, voeux1
function search() {
	const input = document.getElementById("search-input");
	let filter = input.value.toUpperCase();
	const table = document.getElementById("myTable");
	const tr = table.getElementsByTagName("tr");
	for (let i = 0; i < tr.length; i++) {
		let td = tr[i].getElementsByTagName("td")[0];
		let tdNom = tr[i].getElementsByTagName("td")[1];
		let tdPrenom = tr[i].getElementsByTagName("td")[2];
		let tdVoeux1 = tr[i].getElementsByTagName("td")[4];
		if (td) {
			let txtValue = td.textContent || td.innerText;
			let nomValue = tdNom.textContent || tdNom.innerText;
			let prenomValue = tdPrenom.textContent || tdPrenom.innerText;
			let voeux1Value = tdVoeux1.textContent || tdVoeux1.innerText;
			if (txtValue.toUpperCase().indexOf(filter) > -1 || nomValue.toUpperCase().indexOf(filter) > -1 
				|| prenomValue.toUpperCase().indexOf(filter) > -1 || voeux1Value.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}