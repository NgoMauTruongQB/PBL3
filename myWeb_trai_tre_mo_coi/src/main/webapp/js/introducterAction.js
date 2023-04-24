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

function searchAddress() {
    var addInput, filter, table, tr, td, i, txtValue;
    addInput = document.getElementById("sAddress");
    filter = addInput.value.toUpperCase();
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

function searchPhone() {
    var phoneInput, filter, table, tr, td, i, txtValue;
    phoneInput = document.getElementById("sPhone");
    filter = phoneInput.value.toUpperCase();
    table = document.getElementById("data-table");
    tr = table.getElementsByTagName("tr");

    for(i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[3];
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
    var nameInput, phoneInput, addInput, filter, table, tr, td, i, txtValue;
    nameInput = document.getElementById("sName");
    phoneInput = document.getElementById("sPhone");
    addInput = document.getElementById("sAddress");
    filter = {
        name: nameInput.value.toUpperCase(),
        phone: phoneInput.value,
        add: addInput.value.toUpperCase(),
    };
    table = document.getElementById("data-table");
    tr = table.getElementsByTagName("tr");
  
    for(i = 0; i < tr.length; i++) {
        tdName = tr[i].getElementsByTagName("td")[1];
        tdPhone = tr[i].getElementsByTagName("td")[3];
        tdAdd = tr[i].getElementsByTagName("td")[2];
        if(tdName || tdPhone || tdAdd ) {
            txtValueName = tdName.textContent || tdName.innerText;
            txtValuePhone = tdPhone.textContent || tdPhone.innerText;
            txtValueAdd = tdAdd.textContent || tdAdd.innerText;
            if (
                txtValueName.toUpperCase().indexOf(filter.name) > -1 &&
                txtValuePhone.toUpperCase().indexOf(filter.phone) > -1 &&
                txtValueAdd.toUpperCase().indexOf(filter.add) > -1
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