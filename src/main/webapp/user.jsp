<%@ page import="uz.pdp.category.entity.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foydalanuvchi Profili</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .profile-container {
            text-align: center;
            margin-top: 50px;
            background-color: #ffffff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin-left: auto;
            margin-right: auto;
        }

        .user-initial {
            width: 80px;
            height: 80px;
            background-color: #007bff;
            color: white;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 40px;
            font-weight: bold;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            margin: 0 auto 20px;
        }

        .profile-info {
            margin-bottom: 20px;
        }

        .profile-info h4 {
            margin: 10px 0;
            font-size: 20px;
            font-weight: bold;
        }

        .profile-info p {
            font-size: 16px;
            color: #555;
        }

        .logout-btn {
            background-color: #e53935;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>

<%

    User user = (User) request.getSession().getAttribute("user");


    char initial = user.getFirstname().toUpperCase().charAt(0);
%>

<div class="profile-container">

    <div class="user-initial">
        <%= initial %>
    </div>


    <div class="profile-info">
        <h4>Ism: <%= user.getFirstname() %></h4>
        <p><strong>Familiya:</strong> <%= user.getLastname() %></p>
        <p><strong>Telefon:</strong> <%= user.getPhone() %></p>
    </div>


    <form action="/delate" method="post">
        <button type="submit" class="logout-btn">Delate Account</button>
        <input name="user" type="hidden" value="<%=user.getId()%>">
    </form>
</div>

</body>
</html>
