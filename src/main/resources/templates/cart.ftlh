<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: left;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .total {
            font-weight: bold;
            text-align: right;
        }


        .product-grid {
            display: grid;
            grid-template-columns: repeat(1, 1fr);
            gap: 20px;
            margin-left: 260px;
            height: 500px;
            overflow-y: auto;
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

    </style>
</head>
<body>
<div class="container">
    <h1>My Cart</h1>

    <div class="product-grid">
        <#if cart_client?size == 0>
            <h3>There are no items in your cart.</h3>
        <#else>
            <#list cart_client?keys as shoeKey>
                <tbody>
                <#attempt>
                    <#assign shoe = cart_client[shoeKey]>
                    <div class="product-card" data-audience="${shoe.forWho}">
                        <a href="${shoe.id - 1}" style="text-decoration: none; color: inherit">
                            <table style="margin-left: 20px; height: 300px">
                                <tr>
                                    <td class="product-card" style="width: 450px; height: 300px">
                                        <img src="${shoe.url}">
                                    </td>
                                    <td>
                                        <h3 style="font-weight: lighter">${shoe.forWho}</h3>
                                        <h2>${shoe.name}</h2>
                                        <p style="font-weight: bold">$${shoe.price}</p>
                                    </td>
                                </tr>
                            </table>
                        </a>
                    </div>
                    <#recover>
                        <tr>
                            <td colspan="4">Ошибка</td>
                        </tr>
                </#attempt>
                </tbody>
            </#list>

        </#if>


    </div>
</div>
</body>
</html>
