function createRow(str) {
    //create the first text field
    let input1 = document.createElement("input");
    input1.type = "text";
    input1.placeholder = "Date";

    let select = document.createElement("select");
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "/subjects?direction=" + encodeURIComponent('${str}'));
    xhr.onload = function () {
        if (xhr.status === 200) {
            let data = JSON.parse(xhr.responseText);
            for (let i = 0; i < data.length; i++) {
                let option = document.createElement("option");
                option.value = "option" + (i + 1);
                option.text = data[i];
                select.add(option);
            }
        }
    };
    xhr.send();

    // create the second text field
    let input2 = document.createElement("input");
    input2.type = "text";
    input2.placeholder = "Mark";

    let button = document.createElement("button");
    button.textContent = "Сохранить";

    // append the elements to the form container
    let container = document.getElementById("form-container");
    container.appendChild(input1);
    container.appendChild(select);
    container.appendChild(input2);
    container.appendChild(document.createElement("br"));
    container.appendChild(button);
}