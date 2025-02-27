<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Students</title>

    <#--css-->
    <link rel="stylesheet" href="../css/table.css">
    <link rel="stylesheet" href="../css/generalStyles.css">


    <#--js-->
    <#--TODO не работает импорт скрипта-->
    <script src="../js/subjectRequest.js"></script>
</head>
<body>

<div style="text-align: center;">
    <H1>Student</H1>

    <hr>

    <b>Имя: </b> ${student.name}<br/>
    <b>Фамилия: </b> ${student.surname}<br/>
    <b>Возраст: </b> ${student.age}<br/>
    <b>Город: </b> ${student.city}<br/>
    <b>Направление: </b> ${student.educationalDirection}<br/>
</div>

<div class="table-wrapper">
    <table class="fl-table">
        <tr>
            <thead>
            <th>Дата</th>
            <th>Предмет</th>
            <th>Оценка</th>
            </thead>
        </tr>

        <#--TODO: при создании нового студента не работает таблица оценок до перезапуска проги-->
        <#if student.dateList?size == 0>
            <tbody>
            <tr>
                <td colspan="3">Оценки отсутствуют"</td>
            </tr>
            </tbody>
        <#else>
            <#list student.dateList as date>
                <tbody>
                <#attempt>
                    <tr>
                        <#assign index = date?index>
                        <th>${date}</th>
                        <th>${student.subjectList[index]}</th>
                        <th>${student.markList[index]}</th>
                    </tr>
                    <#recover>
                        <tr>
                            <td colspan="3">Ошибка</td>
                        </tr>
                </#attempt>
                </tbody>
            </#list>
        </#if>

    </table>
</div>

<button onclick="createRow()">Добавить запись</button>
<div id="form-container"></div>

<script>
    //TODO не отрабатывает метод
    function checkValue() {
        const inputValue = Number(document.getElementById("input2").value);
        const validationMessage = validateInput(inputValue);

        if (validationMessage) {
            alert(validationMessage);
        } else {
            console.log("Невалидные данные");
        }
    }

    function validateInput(inputValue) {
        const minValue = 1;
        const maxValue = 5;

        if (inputValue < minValue || inputValue > maxValue) {
            return "Некорректная оценка";
        }

        return null;
    }

    function createRow() {


<br>
<hr>
<br>

<form action="/student/delete/${student.id}" method="post">
    <input type="submit" value="Удалить студента"/>
</form>

</body>
</html>