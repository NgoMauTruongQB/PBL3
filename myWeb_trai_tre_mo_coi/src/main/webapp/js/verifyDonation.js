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

function searchFullname() {
    var fullnameInput, filter, table, tr, td, i, txtValue;
    fullnameInput = document.getElementById("sFullname");
    filter = fullnameInput.value.toUpperCase();
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


function searchState() {
    var stateInput, filter, table, tr, td, i, txtValue;
    stateInput = document.getElementById("sState");
    filter = stateInput.value;
    if (filter == "0") {
        filter = "Đang xác thực".toUpperCase();
    } else {
        filter = "Hoàn tất".toUpperCase();
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

function searchDate() {
    const dateInput = document.getElementById("sDate").value;
    const table = document.getElementById("data-table");
    const rows = table.getElementsByTagName("tr");

    for (let i = 0; i < rows.length; i++) {
        const date = rows[i].getElementsByTagName("td")[5].textContent;
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
