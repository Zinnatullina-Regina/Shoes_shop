<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Balance Catalog</title>

    <style>
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

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            display: inline;
            margin-right: 20px;
        }

        nav ul li a {
            text-decoration: none;
            color: #333;
        }

        main {
            margin-left: 20px;
            margin-right: 20px;
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

        .navigation {
            background-color: #ffffff;
            color: #333;
            padding: 10px;
            text-align: left;
            position: fixed;
            left: 0;
            top: 90px; /* Adjust this value according to your header height */
            height: calc(100% - 80px); /* Adjust this value according to your header height */
            width: 240px;
            overflow-y: auto;
        }

        .navigation ul {
            padding: 0;
        }

        .navigation ul li {
            margin-bottom: 10px;

        }

        .navigation ul li a {
            color: #333;
            text-decoration: none;
        }

        .table{
            border-collapse: collapse;
            font-size: small;
            font-weight: normal;
            border: black;
            border: solid;
            border-width: 1px 0;

        }
        th, td {
            border: 1px solid black;
        }


    </style>



</head>
<body>
<header>
    <div class="logo">
        <img src="https://www.newbalance.com.au/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw46024df4/images/homepage/footer/logo.svg" alt="New Balance Logo" style="width: 50px; height: 50px">
    </div>
    <nav>
        <ul >
            <li><a href="#show_shoe">Show shoes</a></li>
            <li><a href="#insert_shoe">Insert shoes</a></li>
            <li><a href="#delete_shoe">Delete shoes</a></li>
            <li><a href="#show_clients">Show clients</a></li>
            <li><a href="#insert_clients">Insert clients</a></li>
            <li><a href="#delete_clients">Delete clients</a></li>
            <li><a href="#show_shoes_sizes">Show shoes sizes</a></li>
            <li><a href="#insert_shoe_sizes">Insert shoes sizes</a></li>
            <li><a href="#delete_shoe_sizes">Delete shoes sizes</a></li>
        </ul>
    </nav>

    </div>
</header>

<main>
    <div id="show_shoe">
        <h2>Show Shoes</h2>
        <table id="shoe_table" class="table">
            <tr>
                <thead>
                <th style="background: CRIMSON" ><h3>id</h3></th>
                <th style="background: CRIMSON" ><h3>name</h3></th>
                <th style="background: CRIMSON" ><h3>price</h3></th>
                <th style="background: CRIMSON" ><h3>type</h3></th>
                <th style="background: CRIMSON" ><h3>forWho</h3></th>
                <th style="background: CRIMSON" ><h3>url</h3></th>
                <th style="background: CRIMSON" ><h3>info</h3></th>
                </thead>
            </tr>
            <#list shoes as shoe>
                <tbody>
                <#attempt>
                    <tr>
                        <th style="width: 50px">${shoe.id}</th>
                        <th style="width: 150px">${shoe.name}</th>
                        <th style="width: 100px">${shoe.price}</th>
                        <th>${shoe.type}</th>
                        <th style="width: 100px">${shoe.forWho}</th>
                        <th style="width: 300px">${shoe.url}</th>
                        <th style="font-size: smaller">${shoe.info}</th>
                    </tr>
                    <#recover>
                        <tr>
                            <td colspan="3">Ошибка</td>
                        </tr>
                </#attempt>
                </tbody>
            </#list>
        </table>

    </div>
    <br>
    <div id="insert_shoe">
        <h2>Insert Shoes</h2>
        <form action="/add_shoes"  method="post">
            <label for="name">name:</label><br>
            <input type="text" id="name" name="name" required><br>
            <label for="price">price:</label><br>
            <input type="number" id="price" name="price" required><br>
            <label for="type">type:</label><br>
            <input type="text" id="type" name="type" required><br>
            <label for="forWho">forWho:</label><br>
            <input type="text" id="forWho" name="forWho" required><br>
            <label for="url">url:</label><br>
            <input type="url" id="url" name="url" required><br>
            <label for="info">info:</label><br>
            <input type="text" id="info" name="info" required><br>

            <input type="submit" value="Submit">

        </form>
    </div>
    <br>
    <div id="delete_shoe">
        <h2>Delete Shoes</h2>
        <form action="/del_shoes"  method="post">
            <label for="id">ID:</label><br>
            <input type="number" id="id" name="id" required><br>

            <input type="submit" value="Submit">

        </form>
    </div>
    <br>
    <div id="show_clients">
        <h2>Show Clients</h2>
        <table id="clients_table" style="margin-bottom: 80px" class="table">
            <tr>
                <thead>
                <th style="background: CRIMSON" ><h3>id</h3></th>
                <th style="background: CRIMSON" ><h3>first_name</h3></th>
                <th style="background: CRIMSON" ><h3>last_name</h3></th>
                <th style="background: CRIMSON" ><h3>email</h3></th>
                <th style="background: CRIMSON" ><h3>role</h3></th>

                </thead>
            </tr>
            <#list clients as client>
                <tbody>
                <#attempt>
                    <tr>
                        <th style="width: 50px">${client.id}</th>
                        <th style="width: 400px">${client.first_name}</th>
                        <th style="width: 400px">${client.last_name}</th>
                        <th style="width: 400px">${client.email}</th>
                        <th style="width: 250px">${client.role}</th>
                    </tr>
                    <#recover>
                        <tr>
                            <td colspan="3">Ошибка</td>
                        </tr>
                </#attempt>
                </tbody>
            </#list>
        </table>
    </div>
    <br>
    <div id="insert_clients">
        <h2>Insert clients</h2>
        <form action="/add_clients"  method="post">
            <label for="first_name">first_name:</label><br>
            <input type="text" id="first_name" name="first_name" required><br>
            <label for="last_name">last_name:</label><br>
            <input type="text" id="last_name" name="last_name" required><br>
            <label for="email">type:</label><br>
            <input type="email" id="email" name="email" required><br>
            <label for="role">role:</label><br>
            <input type="text" id="role" name="role" required><br>
            <label for="password">password:</label><br>
            <input type="text" id="password" name="password" required ><br>
            <input type="submit" value="Submit">

        </form>
    </div>
    <br>
    <div id="delete_clients">
        <h2>Delete clients</h2>
        <form action="/del_clients"  method="post">
            <label for="id">ID:</label><br>
            <input type="number" id="id" name="id" required><br>

            <input type="submit" value="Submit">

        </form>
    </div>
    <br>
    <div id="show_shoes_sizes">
        <h2>Show sizes table</h2>
        <table id="shoes_sizes_table" style="margin-bottom: 80px" class="table">
            <tr>
                <thead>
                <th style="background: CRIMSON" ><h3>id</h3></th>
                <th style="background: CRIMSON" ><h3>size_5</h3></th>
                <th style="background: CRIMSON" ><h3>size_6</h3></th>
                <th style="background: CRIMSON" ><h3>size_7</h3></th>
                <th style="background: CRIMSON" ><h3>size_8</h3></th>
                <th style="background: CRIMSON" ><h3>size_9</h3></th>
                <th style="background: CRIMSON" ><h3>size_10</h3></th>
                <th style="background: CRIMSON" ><h3>size_11</h3></th>
                <th style="background: CRIMSON" ><h3>size_12</h3></th>
                <th style="background: CRIMSON" ><h3>size_13</h3></th>
                <th style="background: CRIMSON" ><h3>size_14</h3></th>
                <th style="background: CRIMSON" ><h3>size_15</h3></th>

                </thead>
            </tr>
            <#list shoes_sizes as shoes_size>
                <tbody>
                <#attempt>
                    <tr>
                        <th style="width: 50px">${shoes_size.id}</th>
                        <th style="width: 150px">${shoes_size.size_5}</th>
                        <th style="width: 150px">${shoes_size.size_6}</th>
                        <th style="width: 150px">${shoes_size.size_7}</th>
                        <th style="width: 150px">${shoes_size.size_8}</th>
                        <th style="width: 150px">${shoes_size.size_9}</th>
                        <th style="width: 150px">${shoes_size.size_10}</th>
                        <th style="width: 150px">${shoes_size.size_11}</th>
                        <th style="width: 150px">${shoes_size.size_12}</th>
                        <th style="width: 150px">${shoes_size.size_13}</th>
                        <th style="width: 150px">${shoes_size.size_14}</th>
                        <th style="width: 150px">${shoes_size.size_15}</th>
                    </tr>
                    <#recover>
                        <tr>
                            <td colspan="3">Ошибка</td>
                        </tr>
                </#attempt>
                </tbody>
            </#list>
        </table>
    </div>
    <br>
    <div id="insert_shoe_sizes">
        <h2>Insert shoes sizes</h2>
        <form action="/add_shoes_sizes"  method="post">
            <label for="id">id:</label><br>
            <input type="number" id="id" name="id" required><br>
            <label for="column_size">column_size:</label><br>
            <input type="number" id="column_size" name="column_size" required><br>
            <label for="add_sizes">add_sizes:</label><br>
            <input type="number" id="add_sizes" name="add_sizes" required><br>

            <input type="submit" value="Submit">

        </form>
    </div>
    <br>
    <div id="delete_shoe_sizes" style="margin-bottom: 80px">
        <h2>Delete shoes sizes</h2>
        <form action="/del_shoes"  method="post">
            <label for="id">ID:</label><br>
            <input type="number" id="id" name="id" required><br>
            <label for="column_size">column_size:</label><br>
            <input type="number" id="column_size" name="column_size" required><br>

            <input type="submit" value="Submit">

        </form>
    </div>
</main>

<footer>
    <p>&copy; 2024 New Balance. All rights reserved.</p>
</footer>
<script>



</script>




</body>
</html>
