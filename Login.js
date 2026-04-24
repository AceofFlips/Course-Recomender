//Do something after login is verified and add session/local storage login token

var sumbitForm = document.getElementById("login-form");
sumbitForm.addEventListener("submit", function(event) {
    event.preventDefault();
    var input = $("#login-form").serializeArray();
    var canLogin = verifyLogin(input[0].value, input[1].value);
    if (canLogin) {
        console.log("Valid Login Credentials");
    } else {
        console.log("Invalid Login Credentials")
    }
})

async function verifyLogin(username, password) {
    try {
        //get user credentials file
        const response = await fetch('users.txt');
        const text = await response.text();
        //trim of edges
        const lines = text.split(/\r?\n/);
        //iterate through lines
        for (let line of lines) {
            //split into username and password
            const [storedUser, storedPass] = line.split(':');
            //check to see if crednetials match
            if (storedUser === username && storedPass === password) {
                return true;
            } else {
                return false;
            }
        }
    } catch (err) {
        console.error("Error reading file:");
    }
}