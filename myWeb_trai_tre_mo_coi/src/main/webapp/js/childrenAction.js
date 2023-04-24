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

function searchState() {
    var stateInput, filter, table, tr, td, i, txtValue;
    stateInput = document.getElementById("sState");
    filter = stateInput.value;
    if (filter == "1") {
        filter = "Đang sinh sống".toUpperCase();
    } else {
        filter = "Đã chuyển đi".toUpperCase();
    }
    table = document.getElementById("data-table");
    tr = table.getElementsByTagName("tr");

    for(i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[8];
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
    const genderInput = document.getElementById("sGender").value.toUpperCase();  
    var stateTmp = document.getElementById("sState").value;
    if (stateTmp == "1") {
        var stateInput = "Đang sinh sống".toUpperCase();
    } else {
        var stateInput = "Đã chuyển đi".toUpperCase();
    }
    const table = document.getElementById("data-table");
    const rows = table.getElementsByTagName("tr");

    for (let i = 0; i < rows.length; i++) {
        const name = rows[i].getElementsByTagName("td")[2].textContent.toUpperCase();
        const gender = rows[i].getElementsByTagName("td")[3].textContent.toUpperCase();
        const date = rows[i].getElementsByTagName("td")[4].textContent;
        const state = rows[i].getElementsByTagName("td")[8].textContent.toUpperCase();
  
        // Kiểm tra nếu giá trị của dòng hiện tại không chứa từ khóa tìm kiếm thì ẩn dòng đó đi
        if (name.includes(nameInput) && gender.includes(genderInput) && state.includes(stateInput)) {
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