<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Balance Catalog</title>

    <link rel="stylesheet" href="../css/catalog_style.css">
    <script src="../js/catalog_script.js"></script>



</head>
<body>
<header>
    <div class="logo">
        <img src="https://www.newbalance.com.au/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw46024df4/images/homepage/footer/logo.svg" alt="New Balance Logo" style="width: 50px; height: 50px">
    </div>
    <nav>
        <ul>
            <li><a href="#" id="men-link" class="category">Men’s</a></li>
            <li><a href="#" id="women-link" class="category">Women’s</a></li>
            <li><a href="#" id="kids-link" class="category">Kids</a></li>
        </ul>
    </nav>
    <div class="search">
        <input type="text" placeholder="Search...">
        <button>Search</button>
    </div>
    <div class="auth">
    <#if status = false>
        <a href="/log"><img src=" https://cdn-icons-png.freepik.com/256/1077/1077063.png?semt=ais_hybrid" title="Login" style="width: 40px; height: 40px"></a>
    <#elseif status = true && client.getRole() == "user">
        <a href="/cart"><img src="https://cdn-icons-png.freepik.com/256/2956/2956827.png?ga=GA1.1.1840897854.1713458684&semt=ais_hybrid" title="Cart" style="width: 40px; height: 40px"></a>
    <#elseif status = true && client.getRole() == "admin">
        <a href="/adm"><img src="https://cdn-icons-png.freepik.com/256/8162/8162801.png?ga=GA1.1.1840897854.1713458684&semt=ais_hybrid" title="Adm" style="width: 40px; height: 40px"></a>

    </#if>
    </div>
</header>

<div class="navigation" >
    <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Shop</a></li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Contact</a></li>
    </ul>
</div>

<main>
    <div class="product-grid">


            <#list shoes as shoe>
                <tbody>
                <#attempt>

                    <div  class="product-card" data-audience="${shoe.forWho}">
                        <a href="${shoe.id - 1}" style="text-decoration: none; color: inherit" >
                        <img src="${shoe.url}">
                        <h3>${shoe.name}</h3>
                        <h6>${shoe.forWho}</h6>
                        <p>${shoe.price}</p>
                        </a>
                    </div>


                    <#recover>
                        <tr>
                            <td colspan="4">Ошибка</td>
                        </tr>
                </#attempt>
                </tbody>
            </#list>


    </div>


</main>

<footer>
    <p>&copy; 2024 New Balance. All rights reserved.</p>
</footer>
<script>

    var categoryLinks = document.querySelectorAll('.category');

    categoryLinks.forEach(function(link) {
        link.addEventListener('click', function() {
            categoryLinks.forEach(function(item) {
                item.classList.remove('active');
            });
            link.classList.add('active');
            var audienceType = link.textContent;
            filterProductCards(audienceType);
        });
        setTimeout(function() {
            window.scrollTo(0, 0);
        }, 100);
    });

    // Функция для фильтрации карточек продуктов по типу аудитории
    function filterProductCards(audienceType) {
        var allProductCards = document.querySelectorAll('.product-card');
        allProductCards.forEach(function(card) {
            var audience = card.getAttribute('data-audience');
            if (audience === audienceType || ((audienceType === 'Men’s' || audienceType === 'Women’s') && audience === 'Unisex')) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    }

    // Получаем элементы карточек продуктов
    var productCards = document.querySelectorAll('.product-card');

    function handleSearch() {
        var searchText = document.querySelector('.search input[type="text"]').value.toLowerCase();
        productCards.forEach(function(card) {
            var cardName = card.querySelector('h3').textContent.toLowerCase();
            if (cardName.includes(searchText)) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }

        });

    }

    // Добавляем обработчик события для кнопки поиска
    document.querySelector('.search button').addEventListener('click', handleSearch);

    // Добавляем обработчик события для поля ввода поиска, чтобы можно было искать по нажатию Enter
    document.querySelector('.search input[type="text"]').addEventListener('keypress', function(event) {
        if (event.key === 'Enter') {
            handleSearch();
        }
    });

</script>




</body>
</html>
