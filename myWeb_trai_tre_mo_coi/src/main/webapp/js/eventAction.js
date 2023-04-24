function showHideSearch() {
    var searchDiv = document.getElementById("searchDiv");
    if (searchDiv.style.display === "block") {
        searchDiv.style.display = "none";
    } 
    else {
        searchDiv.style.display = "block";
    }
}

function sortTable(n) {
    var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
    table = document.getElementById("data-table");
    switching = true; 
    dir = "asc";

    while (switching) {
        switching = false;
        rows = table.rows;
        for(i = 0; i < (rows.length - 1); i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("TD")[n];
            y = rows[i + 1].getElementsByTagName("TD")[n];
            if (dir == "asc") {
                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                  shouldSwitch= true;
                  break;
                }
            } 
            else if (dir == "desc") {
                if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                  shouldSwitch = true;
                  break;
                }
            }
        }
        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
            switchcount ++;      
        }
        else {
            if (switchcount == 0 && dir == "asc") {
              dir = "desc";
              switching = true;
            }
        }
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

function searchLocation() {
    var locationInput, filter, table, tr, td, i, txtValue;
    locationInput = document.getElementById("sLocation");
    filter = locationInput.value.toUpperCase();
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
        td = tr[i].getElementsByTagName("td")[7];
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
    const numberInput = document.getElementById("sNumber").value.toUpperCase();
    const locationInput = document.getElementById("sLocation").value.toUpperCase();
    const staffInput = document.getElementById("sStaff").value.toUpperCase();
    const stateInput = document.getElementById("sState").value.toUpperCase();  
    const table = document.getElementById("data-table");
    const rows = table.getElementsByTagName("tr");

    for (let i = 0; i < rows.length; i++) {
        const name = rows[i].getElementsByTagName("td")[1].textContent.toUpperCase();
        const loaction = rows[i].getElementsByTagName("td")[2].textContent.toUpperCase();
        const staff = rows[i].getElementsByTagName("td")[5].textContent;
        const number = rows[i].getElementsByTagName("td")[6].textContent.toUpperCase();
        const state = rows[i].getElementsByTagName("td")[7].textContent.toUpperCase();
  
        if (name.includes(nameInput) && loaction.includes(locationInput) && staff.includes(staffInput) 
                && number.includes(numberInput) && state.includes(stateInput)) {
            rows[i].style.display = "none";
        }
    }
}
