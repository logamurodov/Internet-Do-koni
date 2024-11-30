<%@ page import="java.util.Map" %>
<%@ page import="uz.pdp.category.entity.Product" %>
<%@ page import="uz.pdp.category.DB" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="uz.pdp.category.entity.User" %>
<%@ page import="uz.pdp.category.Backet" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="uz">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Savat</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .container {
      max-width: 1200px;
      margin-top: 50px;
    }
    .cart-item {
      background-color: #fff;
      padding: 15px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
      display: flex;
      justify-content: space-between;
    }
    .cart-item img {
      max-width: 150px;
      border-radius: 8px;
    }
    .item-details {
      flex: 1;
      margin-left: 20px;
    }
    .item-details h4 {
      font-size: 1.2rem;
      font-weight: bold;
    }
    .item-details p {
      font-size: 1rem;
      color: #495057;
    }
    .item-details .d-flex {
      align-items: center;
      justify-content: flex-start;
    }
    .item-details .d-flex input {
      width: 50px;
      text-align: center;
      margin: 0 10px;
    }
    .total-price {
      font-size: 1.5rem;
      font-weight: bold;
      margin-top: 30px;
    }
    .checkout-btn {
      padding: 10px 30px;
      font-size: 1.1rem;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
    }
    .checkout-btn:hover {
      background-color: #0056b3;
    }
    .empty-cart-message {
      text-align: center;
      margin-top: 50px;
      font-size: 1.5rem;
      color: #6c757d;
    }
    .back-btn {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background-color: #dc3545;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      font-size: 1rem;
      cursor: pointer;
    }
    .back-btn:hover {
      background-color: #c82333;
    }
  </style>
</head>
<body>
<div class="container">


  <%
    Backet backet = Objects.requireNonNullElse((Backet) request.getSession().getAttribute("backet"), new Backet());
    Map<Product, Integer> cartItems = backet.getBacket();
    if (cartItems == null) {
      cartItems = new HashMap<>();
    }
    if (!cartItems.isEmpty()) {
      double totalPrice = 0;
    %>
  <h2 class="mb-4">Savatdagi Mahsulotlar</h2>
  <%
      for (Map.Entry<Product, Integer> entry : cartItems.entrySet()) {
        Product product = entry.getKey();
        int quantity = entry.getValue();
        double itemPrice = product.getPrice() * quantity;
        totalPrice += itemPrice;
  %>

  <div class="cart-item">
    <img src="/fiile/<%=product.getId()%>" alt="<%= product.getName() %>">
    <div class="item-details">
      <h4><%= product.getName() %></h4>
      <p class="price">Narxi: <%= product.getPrice() %> so'm</p>
      <div class="d-flex">
        <form action="/amount" method="post">
          <button class="btn btn-dark" name="minus" value="minus">-</button>
          <input type="hidden" name="product" value="<%=product.getId()%>">
        </form>

        <input type="number" class="form-control" value="<%= quantity %>" readonly />

        <form action="/amount" method="post">
          <button class="btn btn-dark" name="minus" value="pilus">+</button>
          <input type="hidden" name="product" value="<%=product.getId()%>">
        </form>
      </div>
    </div>
  </div>
  <% } %>

  <div class="total-price">
    <p>Umumiy narx: <%= totalPrice %> so'm</p>
  </div>

  <div class="d-flex justify-content-end mt-4">
    <%
      User user = (User) request.getSession().getAttribute("user");
      if (user != null) {
    %>
    <form action="/buyurtmaMalumot.jsp" method="post">
      <button type="submit" class="checkout-btn">Tasdiqlash</button>
    </form>
    <%
    } else {
    %>
    <form action="/login.jsp" method="post">
      <button type="submit" class="checkout-btn">Tasdiqlash</button>
    </form>
    <%
      }
    %>
  </div>
  <%
  } else {
  %>
  <div class="empty-cart-message">
    <p>Savat bo'sh!</p>
  </div>
  <form action="/user/categoryuser.jsp">
    <button class="back-btn" onclick="window.history.back()">Orqaga</button>
  </form>

  <%
    }
  %>
</div>
</body>
</html>
