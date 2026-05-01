//Do something after login is verified and add session/local storage login token

var sumbitForm = document.getElementById("login-form");
sumbitForm.addEventListener("submit", function(event) {
    event.preventDefault();
    var input = $("#login-form").serializeArray();
    var canLogin;
    //async thing to make it so the async function is called
    (async () => {
        const canLogin = await verifyLogin(input[0].value, input[1].value);
        if (canLogin) {
            window.location.replace("/Home-Page.html")
        } else {
            console.log("Invalid Credentials");
        }
        })();
})

async function verifyLogin(inputUser, inputPass) {
    try {
        //get text file
        const response = await fetch('users.txt');
        const data = await response.text();

        //split file by line
        const lines = data.split('\n');

        //loop through lines
        for (let line of lines) {
            //split lines into username and password
            const [storedUser, storedPass] = line.split(':');

            if (storedUser.trim() === inputUser && storedPass.trim() === inputPass) {
                //return true if match found
                return true;
            }
        }
        //return false if no matches
        return false;
    } catch (error) {
        console.error("Error reading user file:", error);
    }
}