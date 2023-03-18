const btnRegister = document.getElementById("submit");

var fullname = document.getElementById("name");
var username = document.getElementById("username");
var email = document.getElementById("email");
var password = document.getElementById("password");
var password2 = document.getElementById("password2");

btnRegister.addEventListener('click', function (e) {
    let isValid = checkValidate();

    if (isValid) {
        alert('Gửi đăng ký thành công');
    }
    else {
        alert('Gửi đăng kí thất bại');
        e.preventDefault();
    }
});

function checkValidate() {
    let isCheck = true;

    //check name
    if (fullname) {
        var fullnameValue = fullname.value.trim();
        var errNameValue = document.querySelector(".errName");
        if (fullnameValue.length < 3) {
            
            errNameValue.style.display = "contents";
            isCheck = false;
        } else {
            errNameValue.style.display = "none";
        }   
    } else {
        errNameValue.style.display = "contents";
        isCheck = false;
    }

    //check username 
    if (username) {
        var usernameValue = username.value.trim();
        var errUsernameValue = document.querySelector(".errUsername");
        if (usernameValue.length < 3) {         
            errUsernameValue.style.display = "contents";
            isCheck = false;
        } else {
            errUsernameValue.style.display = "none";
        }   
    } else {
        errUsernameValue.style.display = "contents";
        isCheck = false;
    }

    //check email 
    const emailRegex = /^([A-Za-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    if (email) {
        var emailValue = email.value.trim();
        var errEmailValue = document.querySelector(".errEmail");
        function isValidEmail(email) {
            return emailRegex.test(email);
        }
        if (!isValidEmail(emailValue)) {
            errEmailValue.style.display = "contents";
            isCheck = false;
        } else {
            errEmailValue.style.display = "none";
        }   
    } else {
        errEmailValue.style.display = "contents";
        isCheck = false;
    }

    //check password 
    if (password) {
        var passwordValue = password.value.trim();
        var errPasswordValue = document.querySelector(".errPassword");
        if (passwordValue.length < 4) {         
            errPasswordValue.style.display = "contents";
            isCheck = false;
        } else {
            errPasswordValue.style.display = "none";
        }   
    } else {
        errPasswordValue.style.display = "contents";
        isCheck = false;
    }

    //check password2
    if (password2) {
        var password2Value = password2.value.trim();
        var errPassword2Value = document.querySelector(".errPassword2");
        if (passwordValue !== password2Value || password2Value.length < 4) {         
            errPassword2Value.style.display = "contents";
            isCheck = false;
        } else {
            errPassword2Value.style.display = "none";
        }   
    } else {
        errPassword2Value.style.display = "contents";
        isCheck = false;
    }
    
    return isCheck;
}




