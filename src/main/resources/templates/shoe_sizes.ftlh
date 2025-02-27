<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Balance Catalog</title>

    <style>
        .button {
            background-color: #04AA6D; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .button:hover {
            background-color: white;
            color: black;
        }

        .button5 {
            background-color: white;
            color: black;
            border: 2px solid #555555;
        }
        .button6 {
            background-color: #cf0a2c;
            color: black;
            border: 2px solid #555555;
        }

        .button5:hover {
            background-color: #f84c4c;
            color: white;
        }

        .button6:hover {
            background-color: #710606;
            color: white;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #f8f8f8;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .auth button {
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
            cursor: pointer;
            margin-left: 10px;
        }

        main {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }


        .product-card {
            text-decoration: none !important;
            border: 1px solid #ddd;
            padding: 20px;
            text-align: left;
            width: 350px;
            color: inherit;

        }

        .product-card img {
            max-width: 100%;
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;

        }

        .red-button {
            background-color: red;
            color: white;
        }

        .button5.active {
            background-color: #f10101 !important;
            color: white  !important;
        }



        .button6.active {
            background-color: #710606;
            color: white;
        }


    </style>



</head>
<body>
<header>
    <div class="logo">
        <img src="https://www.newbalance.com.au/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw46024df4/images/homepage/footer/logo.svg" alt="New Balance Logo" style="width: 50px; height: 50px">
    </div>

    <div class="auth">
        <#if status = false>
            <a href="/registr"><img src=" https://cdn-icons-png.freepik.com/256/1077/1077063.png?semt=ais_hybrid" title="Login" style="width: 40px; height: 40px"></a>
        <#elseif status = true && userRole == "user">
            <a href="/cart"><img src="https://cdn-icons-png.freepik.com/256/2956/2956827.png?ga=GA1.1.1840897854.1713458684&semt=ais_hybrid" title="Cart" style="width: 40px; height: 40px"></a>
        </#if>
    </div>
</header>


<main>
    <table style="margin-left: 20px; height: 300px">
        <tr>
            <td class="product-card" style="width: 450px; height: 300px" >
            <img src="${shoes.url}" >
            </td>
            <td>
                <h3 style="font-weight: lighter">${shoes.forWho}</h3>
                <h2>${shoes.name}</h2>
                <p style="font-weight: bold">$${shoes.price}</p>
                <h3>Available Sizes</h3>
                <button class="button button5">US 5</button>
                <button class="button button5">US 6</button>
                <button class="button button5">US 7</button>
                <button class="button button5">US 8</button>
                <button class="button button5">US 9</button>
                <button class="button button5">US 10</button>
                <button class="button button5">US 11</button>
                <button class="button button5">US 12</button>
                <button class="button button5">US 13</button>
                <button class="button button5">US 14</button>
                <button class="button button5">US 15</button>

                <h3>Discription</h3>
                <h3 style="font-weight: lighter">${shoes.info}</h3>

                <button class="button button6" style="width: 250px">Add to cart</button>
            </td>
        </tr>


    </table>



</main>

<script>

    document.addEventListener("DOMContentLoaded", function() {
        var activeButton = null;
        var sizeButtons = document.querySelectorAll('.button5');
        var addToCartButton = document.querySelector('.button6');

        // Обработчик клика для кнопок выбора размера
        sizeButtons.forEach(function(button) {
            button.addEventListener('click', function() {
                if (activeButton !== null) {
                    activeButton.classList.remove('active');
                }
                activeButton = button;
                activeButton.classList.add('active');
            });
        });

        // Обработчик клика для кнопки "Add to cart"
        addToCartButton.addEventListener('click', function() {
            if (activeButton !== null) {
                var selectedSize = activeButton.textContent.trim();
                // Теперь вы можете добавить логику для отправки выбранного размера в корзину
                // Например, отправить запрос на сервер или использовать localStorage для временного хранения данных
                console.log("Added to cart with size: " + selectedSize);
            } else {
                alert("Please select a size before adding to cart.");
            }
        });
    });
</script>




</body>
</html>
