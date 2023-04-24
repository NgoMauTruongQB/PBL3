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

// natural img
const img = document.getElementById('preview');
const width = img.naturalWidth;
const height = img.naturalHeight;
var windowWidth = window.innerWidth;
let newWidth;
let newHeight;
if (windowWidth > 1023) {
    newWidth = 10;
    newHeight = 10;

    if (width > height) {
        newWidth = newHeight
    } else if (height > width) {
        newHeight = newWidth
    }
} else {
    newWidth = 8;
    newHeight = 8;

    if (width > height) {
        newWidth = newHeight
    } else if (height > width) {
        newHeight = newWidth
    }
}

img.style.width = `${newWidth}rem`;
img.style.height = `${newHeight}rem`;