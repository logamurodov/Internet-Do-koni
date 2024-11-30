<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="uz.pdp.category.Order" %>
<%@ page import="uz.pdp.category.OrderItem" %>
<%@ page import="uz.pdp.category.DB" %>
<%@ page import="uz.pdp.category.entity.Product" %>
<%@ page import="uz.pdp.category.entity.User" %>
<!DOCTYPE html>
<html lang="uz">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mening Buyurtmalarim</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }

    .order-container {
      margin-bottom: 30px;
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 15px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .order-header {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }

    th {
      background-color: #f4f4f4;
    }

    .total-price {
      text-align: right;
      font-weight: bold;
    }
  </style>
</head>
<body>
<h1>Mening Buyurtmalarim</h1>

<%
  User user = (User) request.getSession().getAttribute("user");
  if (user == null) {
%>
<p class="text-danger">Iltimos, avval tizimga kiring.</p>
<%
} else {
  List<Order> userOrders = DB.ORDERS.stream()
          .filter(order -> order.getUserId().equals(user.getId()))
          .collect(Collectors.toList());

  if (userOrders.isEmpty()) {
%>
<p>Siz hali buyurtma bermagansiz.</p>
<%
} else {
  for (Order order : userOrders) {
    List<OrderItem> orderItems = DB.ORDERITEMS.stream()
            .filter(item -> item.getOrderId().equals(order.getId()))
            .collect(Collectors.toList());

    double totalPrice = orderItems.stream()
            .mapToDouble(item -> item.getProduct().getPrice() * item.getAmount())
            .sum();
%>
<div class="order-container">
  <div class="order-header">
    Buyurtma raqami: <%= order.getId() %> | Sana: <%= order.getLocalDate() %>
  </div>
  <table>
    <thead>
    <tr>
      <th>Mahsulot</th>
      <th>Miqdor</th>
      <th>Bitta narxi</th>
      <th>Jami narxi</th>
    </tr>
    </thead>
    <tbody>
    <%
      for (OrderItem item : orderItems) {
        Product product = item.getProduct();
        double totalItemPrice = product.getPrice() * item.getAmount();
    %>
    <tr>
      <td><%= product.getName() %></td>
      <td><%= item.getAmount() %></td>
      <td><%= product.getPrice() %> so'm</td>
      <td><%= totalItemPrice %> so'm</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <p class="total-price">Jami narx: <%= totalPrice %> so'm</p>
</div>
<%
      }
    }
  }
%>
<form action="/user/categoryuser.jsp"  >
  <button type="submit" style="padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;">
    Bosh sahifaga qaytish
  </button>
</form>
</body>
</html>
