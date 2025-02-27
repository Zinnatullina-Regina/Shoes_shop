<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Balance - Customer Authentication</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://www.newbalance.com.au/dw/image/v2/AASX_PRD/on/demandware.static/-/Library-Sites-NBAU-NBNZ/default/dw22c41be5/images/page-designer/2024/9060AAAApril24_Comp_K_Image.jpg'); /* Замените 'background.jpg' на ссылку на вашу картинку */
            background-size: cover;
            background-position: center;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #333;
            color: #fff;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #555;
        }

        .form-group .message {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>New Balance - Customer Authentication</h2>
    <#assign isAlreadyExist = false>
    <form id="registrationForm" action="/registration" method="post">
        <div class="form-group">
            <label for="regFirstName">First Name</label>
            <input type="text" id="regFirstName" name="first_name" required>
        </div>
        <div class="form-group">
            <label for="regLastName">Last Name</label>
            <input type="text" id="regLastName" name="last_name" required>
        </div>
        <div class="form-group">
            <label for="regEmail">Email</label>
            <input type="email" id="regEmail" name="email" required>
        </div>
        <div class="form-group">
            <label for="regPassword">Password</label>
            <input type="password" id="regPassword" name="password" pattern="^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%&])[A-Za-z\d!@#$%&]{8,}$" title="Password must contain at least 8 characters, one uppercase letter, one number, and one special character (! @ # $ % &)" required>
        </div>
        <div class="form-group">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
        <div class="form-group">
            <button type="submit">Register</button>
        </div>
        <div class="form-group">
            <p class="message"><#if isAlreadyExist == true>Account already exist<#else>Already have an account?</#if><a href="log" >Login here</a>.</p>
        </div>
    </form>
</div>


</body>
</html>
