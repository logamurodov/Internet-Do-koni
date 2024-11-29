
<%@ page import="java.util.Objects" %>
<%@ page import="uz.pdp.internetdokon.entity.User" %>
<%@ page import="uz.pdp.internetdokon.entity.Backet" %>
<%@ page import="uz.pdp.internetdokon.entity.Category" %>
<%@ page import="uz.pdp.internetdokon.interface1.DB" %>
<%@ page import="uz.pdp.internetdokon.entity.Product" %>
<%@ page import="uz.pdp.internetdokon.sevrlet.CategorySevrlet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Shop</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXhW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .cart {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user-initial {
            width: 50px;
            height: 50px;
            background-color: #000; /* Rang qora */
            color: whitesmoke;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
            font-weight: bold;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            cursor: default;
        }

        .cart button {
            background-color: #e53935;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 16px;
        }

        .cart button:hover {
            background-color: #d32f2f;
        }

        .category-buttons {
            margin: 20px 0;
            text-align: center;
        }

        .category-buttons form {
            display: inline-block;
            margin: 0 5px;
        }

        .category-buttons button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .category-buttons button:hover {
            background-color: #0056b3;
        }

        .products {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .product-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 250px;
            text-align: center;
            padding: 15px;
        }

        .product-card img {
            max-width: 100%;
            border-radius: 10px;
        }

        .product-card h3 {
            font-size: 18px;
            margin: 10px 0;
        }

        .product-card .price {
            font-size: 16px;
            font-weight: bold;
            color: #e53935;
        }

        .product-card button {
            background-color: #e53935;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        .product-card button:hover {
            background-color: #d32f2f;
        }

        .add-product-section {
            margin-top: 30px;
            text-align: center;
        }

        .add-product-section button {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 15px 30px;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 250px;
        }

        .add-product-section button:hover {
            background-color: #218838;
        }

        header {
            text-align: center;
            background-color: #007bff;
            color: white;
            padding: 20px 0;
            font-size: 24px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%
    User user = (User) request.getSession().getAttribute("user");

%>
<div class="cart">
    <%
        if (user == null) {
    %>
    <form action="/login.jsp" style="margin: 0;">
        <button>Login</button>
    </form>
    <%
    } else {

    %>
    <!-- My Orders -->
    <form action="/orders.jsp" style="margin: 0;">
        <button>My Orders</button>
    </form>

    <form action="/logout" method="post" style="margin: 0;">
        <button>Log out</button>
    </form>
    <%
        }
    %>
    <%
        Backet backet = Objects.requireNonNullElse((Backet) request.getSession().getAttribute("backet"), new Backet());

    %>
    <!-- Savatcha -->
    <form action="/savat.jsp" style="margin: 0;">
        <button>Savatcha(<%=backet.getBacket().size()%>)</button>
    </form>
    <!-- Login -->
    <%
        if (user != null) {
    %>
    <div class="user-initial">
        <%
            char initial = user.getFirstname().toUpperCase().charAt(0);
        %>
        <a href="/user.jsp"><%= initial %>
        </a>

    </div>
    <%
        }
    %>



</div>


<div class="container mt-5">
    <div class="category-buttons">
        <form action="/category" method="get">
            <button>All</button>
            <input type="hidden" name="categoryid" value="0">
        </form>
        <%
            for (Category category : DB.CATEGORIES) {
        %>
        <form action="/category" method="get">
            <button><%= category.getName() %>
            </button>
            <input type="hidden" name="categoryid" value="<%= category.getId() %>">
        </form>
        <%
            }
        %>
    </div>

    <div class="products">
        <%
            for (Product product : DB.PRODUCTS) {
                if (CategorySevrlet.categoryId == 0 || product.getCategoryId().equals(CategorySevrlet.categoryId)) {
        %>
        <form action="/qoshish">
            <div class="product-card">
                <img src="/fiile/<%= product.getId() %>" alt="<%= product.getName() %>" width="150" height="180">
                <h3>Nomi: <%= product.getName() %>
                </h3>
                <p class="price">Narxi: <%= product.getPrice() %> so'm</p>
                <%
                    if (!backet.getBacket().containsKey(product)) {
                %>
                <button class="btn btn-dark">Add to Cart</button>
                <input type="hidden" name="productid" value="<%= product.getId() %>">
                <%
                } else {
                %>
                <button class="btn btn-dark">Remove</button>
                <input type="hidden" name="productid" value="<%= product.getId() %>">
                <%
                    }
                %>
            </div>
        </form>
        <%
                }
            }
        %>
    </div>


</div>
</body>
</html>
