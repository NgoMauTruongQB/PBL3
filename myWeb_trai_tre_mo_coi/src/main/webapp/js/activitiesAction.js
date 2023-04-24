function showHideSearch() {
    var searchDiv = document.getElementById("searchDiv");
    if (searchDiv.style.display === "block") {
        searchDiv.style.display = "none";
    } 
    else {
        searchDiv.style.display = "block";
    }
}

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

function searchPurpose() {
    var purposeInput, filter, table, tr, td, i, txtValue;
    purposeInput = document.getElementById("sPurpose");
    filter = purposeInput.value.toUpperCase();
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

function searchChildrenNumber() {
    var numberInput, filter, table, tr, td, i, txtValue;
    numberInput = document.getElementById("sNumber");
    filter = numberInput.value.toUpperCase();
    table = document.getElementById("data-table");
    tr = table.getElementsByTagName("tr");

    for(i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[6];
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


function searchStaff() {
    var staffInput, filter, table, tr, td, i, txtValue;
    staffInput = document.getElementById("sStaff");
    filter = staffInput.value.toUpperCase();
    table = document.getElementById("data-table");
    tr = table.getElementsByTagName("tr");

    for(i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[5];
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

function searchState() {
    var stateInput, filter, table, tr, td, i, txtValue;
    stateInput = document.getElementById("sState");
    filter = stateInput.value;
    if (filter == "0") {
        filter = "Chưa diễn ra".toUpperCase();
    } else {
        filter = "Đã diễn ra".toUpperCase();
    }
    table = document.getElementById("data-table");
    tr = table.getElementsByTagName("tr");

    for(i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[6];
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

function searchDateBegin() {
    const dateInput = document.getElementById("sDateBegin").value;
    const table = document.getElementById("data-table");
    const rows = table.getElementsByTagName("tr");

    for (let i = 0; i < rows.length; i++) {
        const date = rows[i].getElementsByTagName("td")[3].textContent;
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
    }
}

function searchDateEnd() {
    const dateInput = document.getElementById("sDateEnd").value;
    const table = document.getElementById("data-table");
    const rows = table.getElementsByTagName("tr");

    for (let i = 0; i < rows.length; i++) {
        const date = rows[i].getElementsByTagName("td")[4].textContent;
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
    }
}
