var sumbitForm = document.getElementById("login-form");
sumbitForm.addEventListener("submit", function(event) {
    event.preventDefault();
    var input = $("#login-form").serializeArray();
    console.log(input);
})