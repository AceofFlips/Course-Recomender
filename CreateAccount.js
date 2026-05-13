var sumbitForm = document.getElementById("create-account-form");
sumbitForm.addEventListener("submit", function(event) {
    event.preventDefault();
    var input = $("#create-account-form").serializeArray();
    //async thing to make it so the async function is called
    (async () => {
        sucess = await createUser(input[0].value, input[1].value);
        if (sucess) {
            console.log("User added");
        } else {
            console.log("User failed to be added");
        }
        })();
})

async function createUser(inputUser, inputPass) {
    try {
        //get users file
        const response = await fetch('users.txt');
        const existingUsers = await response.text();
        //add new user
        const updatedUsers = existingUsers + `\n${inputUser}:${inputPass}`;
        //save file
        return true;
    } catch(error) {
        console.error("Couldn't retrieve file", error);
    }
}
