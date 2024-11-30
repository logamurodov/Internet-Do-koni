<%@ page import="uz.pdp.internetdokon.entity.Category" %>
<%@ page import="uz.pdp.internetdokon.interface1.DB" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXhW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-size: 16px;
            font-weight: bold;
        }

        .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }

        .submit-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="form-container">
        <h2>Mahsulot Qo'shish</h2>
        <form action="addproduct1.jsp" method="post">
            <div class="form-group">
                <label for="category">Kategoriya tanlang</label>
                <select name="categoryId" id="category" required>
                    <option value="">Kategoriya tanlang...</option>
                    <%
                        for (Category category : DB.CATEGORIES) {
                    %>
                    <option value="<%=category.getId()%>"><%=category.getName()%></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <button type="submit" class="submit-btn">Mahsulotni Qo'shish</button>
        </form>
    </div>
</div>

</body>
</html>
