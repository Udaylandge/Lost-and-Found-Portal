function validate() {

    let itemName = document.getElementById("item_name").value.trim();
    let description = document.getElementById("description").value.trim();
    let location = document.getElementById("location").value.trim();
    let type = document.getElementById("type").value;
    let contact = document.getElementById("contact").value.trim();

    if (itemName === "") {
        alert("Please enter item name.");
        return false;
    }

    if (description === "") {
        alert("Please enter description.");
        return false;
    }

    if (location === "") {
        alert("Please enter location.");
        return false;
    }

    if (type === "") {
        alert("Please select Lost or Found.");
        return false;
    }

    if (contact === "") {
        alert("Please enter contact details.");
        return false;
    }

    return true;
}