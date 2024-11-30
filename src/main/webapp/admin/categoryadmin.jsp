<%@ page import="uz.pdp.category.entity.Category" %>
<%@ page import="uz.pdp.category.entity.Product" %>
<%@ page import="uz.pdp.category.DB" %>
<%@ page import="uz.pdp.category.entity.User" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
    }
    .container {
      margin-top: 50px;
    }
    .admin-btns {
      text-align: center;
      margin-bottom: 30px;
    }
    .admin-btns button {
      margin: 10px;
      padding: 15px 30px;
      font-size: 16px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    .admin-btns button:hover {
      background-color: #0056b3;
    }
    .section-title {
      margin-top: 30px;
      font-size: 24px;
      font-weight: bold;
      text-align: center;
    }
    .category-list, .product-list {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
    }
    .category-card, .product-card {
      background-color: #fff;
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 20px;
      width: 250px;
      text-align: center;
    }
    .category-card h4, .product-card h4 {
      font-size: 18px;
    }
    .add-category-btn, .add-product-btn {
      background-color: #28a745;
      color: white;
      padding: 15px 30px;
      border: none;
      font-size: 18px;
      border-radius: 5px;
      cursor: pointer;
      display: block;
      margin: 20px auto;
    }
    .add-category-btn:hover, .add-product-btn:hover {
      background-color: #218838;
    }
    .back-btn {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background-color: #dc3545;
      color: white;
      padding: 15px 30px;
      border: none;
      font-size: 18px;
      border-radius: 5px;
      cursor: pointer;
    }
    .back-btn:hover {
      background-color: #c82333;
    }
  </style>
</head>
<body>
<%

//  User user = Objects.requireNonNullElse((User) request.getSession().getAttribute("user"),new User());
//    if ( user.getRole().equals("user")) {
//        response.sendRedirect("/user/categoryuser.jsp");
//        return;
//    }
%>
<div class="container">
  <div class="admin-btns">
    <button id="category-btn">Categories</button>
    <button id="product-btn">Products</button>
  </div>

  <!-- Category Section -->
  <div id="category-section" class="section-content">
    <h2 class="section-title">Categories</h2>
    <div class="category-list">
      <%
        for (Category category : DB.CATEGORIES) {
      %>
      <div class="category-card">
        <h4><%= category.getName() %></h4>
      </div>
      <%
        }
      %>
    </div>
    <form action="addcategory.jsp">
      <button type="submit" class="add-category-btn">Add Category</button>
    </form>
  </div>


  <div id="product-section" class="section-content" style="display: none;">
    <h2 class="section-title">Products</h2>
    <div class="product-list">
      <%
        for (Product product : DB.PRODUCTS) {
      %>
      <div class="product-card">
        <h4><%= product.getName() %></h4>
        <p>Price: <%= product.getPrice() %> so'm</p>
      </div>
      <%
        }
      %>
    </div>
    <form action="addproduct.jsp">
      <button type="submit" class="add-product-btn">Add Product</button>
    </form>
  </div>

  <!-- Back Button -->
  <form  action="/user/categoryuser.jsp">
    <button class="back-btn" id="back-btn">Orqaga</button>
  </form>

</div>

<script>
  // Show category section
  document.getElementById("category-btn").addEventListener("click", function() {
    document.getElementById("category-section").style.display = "block";
    document.getElementById("product-section").style.display = "none";
  });

  // Show product section
  document.getElementById("product-btn").addEventListener("click", function() {
    document.getElementById("product-section").style.display = "block";
    document.getElementById("category-section").style.display = "none";
  });

  // Show admin buttons section
  document.getElementById("back-btn").addEventListener("click", function() {
    document.getElementById("category-section").style.display = "none";
    document.getElementById("product-section").style.display = "none";
  });
</script>

</body>
</html>
