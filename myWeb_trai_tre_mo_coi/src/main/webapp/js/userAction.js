function searchName() {
    var nameInput, filter, table, tr, td, i, txtValue;
    nameInput = document.getElementById("sName");
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

function searchUsername() {
    var usernameInput, filter, table, tr, td, i, txtValue;
    usernameInput = document.getElementById("sUsername");
    filter = usernameInput.value.toUpperCase();
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

function searchEmail() {
    var emailInput, filter, table, tr, td, i, txtValue;
    emailInput = document.getElementById("sEmail");
    filter = emailInput.value.toUpperCase();
    table = document.getElementById("data-table");
    tr = table.getElementsByTagName("tr");

    for(i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[4];
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

function searchRole() {
    var roleInput, filter, table, tr, td, i, txtValue;
    roleInput = document.getElementById("sRole");
    filter = roleInput.value.toUpperCase();
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

function searchTable(event) {
    event.preventDefault(); // Ngăn chặn sự kiện mặc định của nút Submit trong form
    var nameInput, usernameInput, emailInput, roleInput, filter, table, tr, td, i, txtValue;
    nameInput = document.getElementById("sName");
    usernameInput = document.getElementById("sUsername");
    emailInput = document.getElementById("sEmail");
    roleInput = document.getElementById("sRole");
    filter = {
        name: nameInput.value.toUpperCase(),
        username: usernameInput.value.toUpperCase(),
        email: emailInput.value.toUpperCase(),
        role: roleInput.value.toUpperCase()
    };
    table = document.getElementById("data-table");
    tr = table.getElementsByTagName("tr");
  
    for(i = 0; i < tr.length; i++) {
        tdName = tr[i].getElementsByTagName("td")[2];
        tdUsername = tr[i].getElementsByTagName("td")[1];
        tdEmail = tr[i].getElementsByTagName("td")[4];
        tdRole = tr[i].getElementsByTagName("td")[5];
        if(tdName || tdUsername || tdEmail || tdRole) {
            txtValueName = tdName.textContent || tdName.innerText;
            txtValueUsername = tdUsername.textContent || tdUsername.innerText;
            txtValueEmail = tdEmail.textContent || tdEmail.innerText;
            txtValueRole = tdRole.textContent || tdRole.innerText;
            if (
                txtValueName.toUpperCase().indexOf(filter.name) > -1 &&
                txtValueUsername.toUpperCase().indexOf(filter.username) > -1 &&
                txtValueEmail.toUpperCase().indexOf(filter.email) > -1 &&
                txtValueRole.toUpperCase().indexOf(filter.role) > -1
            ) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}
  
const searchForm = document.querySelector('form');
searchForm.addEventListener('submit', searchTable);


function sortTable(n) {
    var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
    table = document.getElementById("data-table");
    switching = true; // hướng sắp xếp mặc định
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