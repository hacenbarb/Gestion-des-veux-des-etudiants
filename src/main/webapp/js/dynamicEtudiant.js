function clearAjouterEtudiantForm() {
	document.querySelector("#nomE").value = "";
	document.querySelector("#prenomE").value = "";
	document.querySelector("#moyenneE").value = "";
}

function ajouterEtudiant() {
	const nomE = document.querySelector("#nomE").value
	const prenomE = document.querySelector("#prenomE").value
	const moyenneE = document.querySelector("#moyenneE").value

	if (nomE && prenomE && moyenneE) {
		$.ajax({
			url: "/Tp3/AjouterEtudiant",
			method: "POST",
			data: {
				nomE: nomE, prenomE: prenomE, moyenneE: moyenneE
			},
			success: () => {
				/*		
						
				const tableBody = document.querySelector("tbody");
				const tableRow = document.createElement("tr");
				const tableCellOne = document.createElement("td");
				const tableCellTwo = document.createElement("td");
				const tableCellThree = document.createElement("td");
				const tableCellFour = document.createElement("td");

				const btn = document.createElement("button")
				btn.classList.add("delete-button", "btn", "btn-danger")
				btn.setAttribute('data-id', prodid)
				btn.textContent = "Delete"
				let sel = document.getElementById("idproduit");
				let text = sel.options[sel.selectedIndex].text;

				tableCellOne.textContent = text
				tableCellTwo.textContent = qte
				tableCellThree.textContent = date
				tableCellFour.appendChild(btn);

				tableRow.appendChild(tableCellOne);
				tableRow.appendChild(tableCellTwo);
				tableRow.appendChild(tableCellThree);
				tableRow.appendChild(tableCellFour);
				tableBody.appendChild(tableRow);
				
				*/
				console.log(nomE + " " + prenomE + " " + moyenneE)
				alert("a new Etudiant has been added")
				clearAjouterEtudiantForm();
			}

		})
	} else {
		console.log("manque d'information")
	}
}
function deleteEtudiant(numE) {
	const isConfirm = confirm("Are you sure you want to delete a student?")
	if (isConfirm) {
		$.ajax({
			url: "/Tp3/SupprimerEtudiant",
			method: "POST",
			data: {
				numE: numE
			},
			success: () => { 
				document.querySelector(`tr[data-id='${numE}']`).remove();
				alert('a student has been deleted');
			}
		})
	} else {
		console.log("delete student has been canceled")
	}
}
const deleteBtns = document.querySelectorAll('.detele-button');
deleteBtns.forEach((btn) => {
	btn.addEventListener("click", (ev) => {
		ev.preventDefault();
		deleteEtudiant(ev.target.dataset.id);
	})
})

document.querySelector('#ajouterEtudiantBtn').addEventListener("click", (ev) => {
	ev.preventDefault();
	ajouterEtudiant();
})