<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NewBalance Store</title>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
            color: #000000;
        }
        /*.about img {*/
        /*    width: 100px; !* Устанавливаем фиксированную ширину *!*/
        /*    height: 100px; !* Устанавливаем фиксированную высоту *!*/
        /*    object-fit: cover; !* Масштабируем изображения так, чтобы они полностью заполняли заданный размер *!*/
        /*}*/
        .header {
            background-color:  #ffffff;
            text-align: center;
            padding: 20px 0;
        }
        .logo {
            width: 150px;
        }

        .about, .contact {
            background-color: #ffffff;
            padding: 20px;
        }
        .navbar {
            background-color: #bbbaba;
            padding: 10px 0;
            text-align: center;
        }
        .navbar a {
            margin: 0 10px;
            text-decoration: none;
            color: #000000;
            font-weight: bold;
        }
        .slick-slider {
            width: 90%;
            margin: 0 auto;
        }
        .slick-slide img {
            width: 100%;
            height: auto;
        }

        .new_bal_test {
            padding: 20px 0;
            text-align: left;
            font-weight: bold;
            margin-left: 200px
        }
        .center_img{
            vertical-align:middle; text-align:center;
        }
    </style>
</head>
<body>

<div class="header">
    <img src="https://www.newbalance.com.au/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw46024df4/images/homepage/footer/logo.svg" alt="NewBalance" class="logo">
</div>

<div class="navbar">
    <a href="#about">About Us</a>
    <a href="#contact">Contact Us</a>
    <a href="catalog">Catalog</a>
</div>

<div class="slick-slider" >
    <div><img src="https://www.newbalance.com.au/dw/image/v2/AASX_PRD/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw4ca64279/images/page-designer/2023/9060Feb24_Comp_J_Image.jpg" alt="Shoe"></div>
    <div><img src="https://www.newbalance.com.au/dw/image/v2/AASX_PRD/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw878fad77/images/page-designer/2024/NBKIC_March2024_Comp_K_Image2.jpg" alt="Shoe 2"></div>
    <div><img src="https://www.newbalance.com.au/dw/image/v2/AASX_PRD/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw715dc71f/images/page-designer/2024/April24_Comp_K_Image3.jpg" alt="Shoe 3"></div>
    <div><img src="https://www.newbalance.com/dw/image/v2/AAGI_PRD/on/demandware.static/-/Library-Sites-NBUS-NBCA/default/dw2e5409c4/images/page-designer/2024/March/16357_Comp_E2_Image1.jpg?sw=808&sfrm=jpg" alt="Shoe 2"></div>
    <!--  <div><img src="" alt="Shoe"></div>  -->
</div>

<div id="about" class="about">
    <h2>About NewBalance</h2>
    <table style="margin-left: 20px;">
        <tr>
            <td class="new_bal_test" style="margin-left: 200px; width: 925px" >
                New Balance is an American company specializing in the manufacture of shoes, clothing and <br>
                accessories for sports and everyday wear.<br>
                It was founded in 1906 in Boston, Massachusetts.<br>
                Initially, the company was engaged in the manufacture of shoe soles, but then expanded its<br>
                activities for the production of sports shoes.<br>
                <br>
                New Balance is distinguished by its "Made in USA" principle,<br>
                adhering to the production strategy in the USA, while<br>
                like many other companies, they move their production abroad.<br>
                They are also famous for their unique approach to the design, functionality and comfort of their shoes.<br>
                <br>
                The company actively develops and innovates technologies to improve the characteristics of its products,<br>
                such as cushioning, foot support and ventilation. As a result, New Balance is popular<br>
                both among professional athletes and fans of an active lifestyle.<br>
                <br>
                But besides sportswear and shoes, New Balance also produces fashion collections that are designed to
                combine style and comfort, suitable for everyday use.<br>
                The company also actively supports communities and sponsors various sports events and
                charitable organizations.</td>
            <td  style="text-align: right">    <img src="https://www.newbalance.com.au/dw/image/v2/AASX_PRD/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw7d168986/images/inside-nb/nb-overview/NBO_Comp_J_Image.jpg" alt="Image 1" style="width: 250px; height: 250px;" >
                <img src="https://www.newbalance.com.au/dw/image/v2/AASX_PRD/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw5dca5362/images/inside-nb/nb-overview/NBO_Comp_R1_Image2_V2.jpg" alt="Image 2" style="width: 250px; height: 250px;"><br>
                <img src="https://www.newbalance.com.au/dw/image/v2/AASX_PRD/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw8e24e195/images/inside-nb/nb-overview/NBO_Comp_R1_Image1.jpg" alt="Image 3" style="width: 250px; height: 250px;">
                <img src="https://www.newbalance.com.au/dw/image/v2/AASX_PRD/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dwba6d51e1/images/inside-nb/nb-overview/NBO_Comp_R1_Image3.jpg" alt="Image 4" style="width: 250px; height: 250px;"></td>
        </tr>
    </table>
</div>

<div style="padding: 40px;" >
    <table>
        <tr>
            <td>
                <div><img src="https://www.newbalance.com.au/dw/image/v2/AASX_PRD/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dwc933dda1/images/inside-nb/nb-overview/NBO_Comp_R2_Image1_V2.jpg" alt="Shoe" style="width: 100%;text-align: right"></div>
            </td>
            <td>
                <div><img src="https://www.newbalance.com.au/dw/image/v2/AASX_PRD/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dwc46d9622/images/inside-nb/nb-overview/NBO_Comp_R2_Image2.jpg" alt="Shoe" style="width: 100%; "></div>
            </td>
            <td>
                <div><img src="https://www.newbalance.com.au/dw/image/v2/AASX_PRD/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dwaa817ed6/images/inside-nb/nb-overview/NBO_Comp_R2_Image3_V2.jpg" alt="Shoe" style="width: 100%; "></div>
            </td>

        </tr>
        <tr style="text-align: center" class="new_bal_test">
            <td style="width: 33%">
                Get up-to-date information on New Balance’s latest projects
                and commitments within our community and around the world.
            </td>
            <td style="width: 33%">
                We’re proud to be the only major company to make or assemble
                more than 4 million pairs of athletic footwear per year in the USA,
                which represents a limited portion of our US sales. Where the
                domestic value is at least 70%, we label our shoes Made in the

            </td>
            <td style="width: 33%">
                At New Balance, movement is at the center of everything we do.
                We’re looking for team members who are committed to moving our
                brands, people and company forward.
            </td>

        </tr>
    </table>
</div>
<div id="contact" class="contact">
    <h2>Contact Us</h2>
    <table style="margin-left: 20px;">
        <tr>
            <td class="new_bal_test" style="margin-left: 500px; width: 1000px" >
                We stand for something bigger than sneakers.<br>
                We champion those who are fearlessly driven by their passions.<br>
                We elevate sport. We do right by people and the planet.<br>
                Together, we drive meaningful change in communities<br>
                around the world. We Got Now.
            </td>
            <td style="text-align: right">
                <table style="margin-left: 200px;">
                    <tr>
                        <img src="https://www.newbalance.com.au/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw46024df4/images/homepage/footer/logo.svg" alt="NewBalance" class="logo">

                    </tr>
                    <tr >
                        <td>
                            <div><a href="https://www.instagram.com/newbalance/"><img src="https://www.newbalance.com.au/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw4d6fbf53/images/homepage/footer/social/instagram.svg" alt="Shoe"></a></div>
                            </td>
                        <td >
                            <div><a href="http://www.facebook.com/Newbalance"><img src="https://www.newbalance.com.au/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw1bb3d78c/images/homepage/footer/social/facebook.svg" alt="Shoe"></a></div>
                            </td>
                        <td >
                            <div><a href="https://twitter.com/NewBalance"><img src="https://www.newbalance.com.au/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw2852326e/images/homepage/footer/social/twitter.svg" alt="Shoe"></a></div>
                            </td>
                        <td>
                            <div><a href="https://www.youtube.com/user/newbalance"><img src="https://www.newbalance.com.au/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw068b88ae/images/homepage/footer/social/youtube.svg" alt="Shoe"></a></div>
                            </td>
                        <td>
                            <div><a href="https://www.pinterest.com/newbalance/"><img src="https://www.newbalance.com.au/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw64fedb0f/images/homepage/footer/social/pinterest.svg" alt="Shoe"></a></div>
                            </td>
                        <td>
                            <div><a href="https://www.tiktok.com/@newbalance"><img src="https://www.newbalance.com.au/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw91bb41fb/images/homepage/footer/social/tiktok.svg" alt="Shoe"></a></div>
                            </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script>
    $(document).ready(function(){
        $('.slick-slider').slick({
            dots: true,
            infinite: true,
            speed: 500,
            slidesToShow: 1,
            adaptiveHeight: true
        });
    });
</script>

</body>
</html>
