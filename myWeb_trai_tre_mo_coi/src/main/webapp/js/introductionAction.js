function searchName() {
    var nameInput, filter, table, tr, td, i, txtValue;
    nameInput = document.getElementById("sName");
    filter = nameInput.value.toUpperCase();
    table = document.getElementById("data-table");
    tr = table.getElementsByTagName("tr");

    for(i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1];
        if(td) {
            txtValue = td.textContent || td.innerText;
            if(txtValue.toUpperCase().indexOf(filter) > -1 ) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function searchName2() {
    var nameInput, filter, table, tr, td, i, txtValue;
    nameInput = document.getElementById("sName2");
    filter = nameInput.value.toUpperCase();
    table = document.getElementById("data-table");
    tr = table.getElementsByTagName("tr");

    for(i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[2];
        if(td) {
            txtValue = td.textContent || td.innerText;
            if(txtValue.toUpperCase().indexOf(filter) > -1 ) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}


function searchTable(event) {
    event.preventDefault(); 
    const nameInput = document.getElementById("sName").value.toUpperCase();
    const dateInput = document.getElementById("sDate").value;
    const name2Input = document.getElementById("sName2").value.toUpperCase ();
    const table = document.getElementById("data-table");
    const rows = table.getElementsByTagName("tr");

    for (let i = 0; i < rows.length; i++) {
        const name = rows[i].getElementsByTagName("td")[1].textContent.toUpperCase();
        const date = rows[i].getElementsByTagName("td")[3].textContent;
        const name2 = rows[i].getElementsByTagName("td")[2].textContent.toUpperCase();
  
        if (name.includes(nameInput) && name2.includes(name2Input)) {
            if (dateInput === "") {
            rows[i].style.display = "";
            } else {
                const dateParts = date.split("/");
                const formattedDate = `${dateParts[2]}-${dateParts[1]}-${dateParts[0]}`;
                if (formattedDate === dateInput) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }
        } else {
            rows[i].style.display = "none";
        }
    }
}
  
const searchForm = document.querySelector('.search-form-js');
searchForm.addEventListener('submit', searchTable);