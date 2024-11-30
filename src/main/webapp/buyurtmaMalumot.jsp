<%@ page import="java.util.Map" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="uz.pdp.internetdokon.entity.Backet" %>
<%@ page import="uz.pdp.internetdokon.entity.Product" %>
<%@ page import="uz.pdp.internetdokon.entity.Order" %>
<%@ page import="uz.pdp.internetdokon.entity.OrderItem" %>
<%@ page import="uz.pdp.internetdokon.interface1.DB" %>
<%@ page import="uz.pdp.internetdokon.entity.User" %>

<%

    User user = (User)request.getSession().getAttribute("user");

    Order order=new Order();
    order.setLocalDate(LocalDate.now());
    order.setUserId(user.getId());


    Backet backet = (Backet) request.getSession().getAttribute("backet");
    Map<Product, Integer> productMap = backet.getBacket();





    double totalPrice = 0;
    for (Map.Entry<Product, Integer> entry : productMap.entrySet()) {
        OrderItem orderItem = new OrderItem();
        orderItem.setProduct(entry.getKey());
        orderItem.setAmount(entry.getValue());
        orderItem.setOrderId(order.getId());
        DB.ORDERITEMS.add(orderItem);

        totalPrice += entry.getKey().getPrice() * entry.getValue();
    }
    DB.ORDERS.add(order);



    NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("uz", "UZ"));
%>

<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buyurtma Cheki</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .total {
            font-weight: bold;
            text-align: right;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Internet Magazini</h1>
    <p>Buyurtma cheki</p>
    <p>Buyurtma raqami: <%=order.getId()%> </p>
    <p>Buyurma berilgan sana: <%= order.getLocalDate() %></p>
</div>
<table>
    <thead>
    <tr>
        <th>Mahsulot nomi</th>
        <th>Miqdor</th>
        <th>Bitta narxi</th>
        <th>Jami</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Map.Entry<Product, Integer> entry : productMap.entrySet()) {
            Product product = entry.getKey();
            int amount = entry.getValue();
    %>
    <tr>
        <td><%= product.getName() %></td>
        <td><%= amount %></td>
        <td><%= currencyFormat.format(product.getPrice()) %></td>
        <td><%= currencyFormat.format(product.getPrice() * amount) %></td>
    </tr>
    <% } %>
    </tbody>
</table>

<p class="total">Jami narx: <%= currencyFormat.format(totalPrice) %></p>


<div style="text-align: center; margin-top: 20px;">
    <form action="/user/categoryuser.jsp" <%  backet.getBacket().clear(); request.getSession().setAttribute("backet",backet); %> >
        <button type="submit" style="padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;">
            Bosh sahifaga qaytish
        </button>
    </form>
</div>
</body>
</html>
