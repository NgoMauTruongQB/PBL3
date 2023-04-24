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

function searchEmail() {
    var emailInput, filter, table, tr, td, i, txtValue;
    emailInput = document.getElementById("sEmail");
    filter = emailInput.value.toUpperCase();
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

function searchPosition() {
    var positionInput, filter, table, tr, td, i, txtValue;
    positionInput = document.getElementById("sPosition");
    filter = positionInput.value.toUpperCase();
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


function searchPhone() {
    var phoneInput, filter, table, tr, td, i, txtValue;
    phoneInput = document.getElementById("sPhone");
    filter = phoneInput.value.toUpperCase();
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

function searchGender() {
    var genderInput, filter, table, tr, td, i, txtValue;
    genderInput = document.getElementById("sGender");
    filter = genderInput.value.toUpperCase();
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
    event.preventDefault(); 
    const nameInput = document.getElementById("sName").value.toUpperCase();
    const positionInput = document.getElementById("sPosition").value.toUpperCase();
    const emailInput = document.getElementById("sEmail").value.toUpperCase();
    const phoneInput = document.getElementById("sPhone").value.toUpperCase();
    const dateInput = document.getElementById("sDate").value;
    const genderInput = document.getElementById("sGender").value.toUpperCase();  
    const table = document.getElementById("data-table");
    const rows = table.getElementsByTagName("tr");

    for (let i = 0; i < rows.length; i++) {
        const name = rows[i].getElementsByTagName("td")[2].textContent.toUpperCase();
        const gender = rows[i].getElementsByTagName("td")[3].textContent.toUpperCase();
        const date = rows[i].getElementsByTagName("td")[4].textContent;
        const position = rows[i].getElementsByTagName("td")[5].textContent.toUpperCase();
        const email = rows[i].getElementsByTagName("td")[6].textContent.toUpperCase();
        const phone = rows[i].getElementsByTagName("td")[7].textContent.toUpperCase();
  
        // Kiểm tra nếu giá trị của dòng hiện tại không chứa từ khóa tìm kiếm thì ẩn dòng đó đi
        if (name.includes(nameInput) && gender.includes(genderInput) && position.includes(positionInput) 
                && email.includes(emailInput) && phone.includes(phoneInput)) {
            // Nếu input date rỗng thì hiển thị tất cả các dòng, ngược lại thì kiểm tra ngày
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

