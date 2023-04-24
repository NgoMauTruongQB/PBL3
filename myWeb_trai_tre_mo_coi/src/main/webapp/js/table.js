const table = document.getElementById('data-table');
const prevBtn = document.getElementById('prev-page');
const nextBtn = document.getElementById('next-page');
const rowsPerPage = 8; // số hàng trên mỗi trang
let currentPage = 0; // trang hiện tại

const pageCount = Math.ceil((table.rows.length) / rowsPerPage);


showPage(currentPage);


prevBtn.addEventListener('click', () => {
  if (currentPage > 0) {
    currentPage--;
    showPage(currentPage);
  }
});

nextBtn.addEventListener('click', () => {
  if (currentPage < pageCount - 1) {
    currentPage++;
    showPage(currentPage);
  }
});


function showPage(page) {
  const start = page * rowsPerPage;
  const end = start + rowsPerPage;
  
  for (let i = 0; i < table.rows.length; i++) {
    if (i < start || i >= end) {
      table.rows[i].style.display = 'none';
    } else {
      table.rows[i].style.display = '';
    }
  }
}