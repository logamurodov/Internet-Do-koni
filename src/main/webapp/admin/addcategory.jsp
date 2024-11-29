<%@ page import="uz.pdp.internetdokon.entity.Category" %>
<%@ page import="uz.pdp.internetdokon.interface1.DB" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Category</title>
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
        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin-left: auto;
            margin-right: auto;
        }
        .form-container input {
            margin-bottom: 20px;
        }
        .form-container button {
            background-color: #28a745;
            color: white;
            padding: 10px 30px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .form-container button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="form-container">
        <h2>Add New Category</h2>
        <form action="/addcategory" method="post">
            <div class="mb-3">
                <label for="categoryName" class="form-label">Category Name</label>
                <input type="text" class="form-control" id="categoryName" name="categoryName" required>
            </div>
            <button type="submit" class="btn btn-success">Create</button>
        </form>
    </div>
</div>

</body>
</html>
