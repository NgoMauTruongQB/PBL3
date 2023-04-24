// reload img
const fileInput = document.getElementById('file-input');
const preview = document.getElementById('preview');

fileInput.addEventListener('change', () => {
    const file = fileInput.files[0];
    const reader = new FileReader();

    reader.addEventListener('load', () => {
    preview.src = reader.result;
    });

    reader.readAsDataURL(file);
});