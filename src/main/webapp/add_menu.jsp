<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Menu</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #fceabb, #f8b500);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            width: 90%;
            max-width: 400px;
            animation: fadeIn 0.8s ease-in-out;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: 0.3s;
        }

        input[type="text"]:focus,
        select:focus {
            border-color: #f8b500;
            box-shadow: 0 0 5px #f8b500;
        }

        input[type="submit"] {
            margin-top: 20px;
            background-color: #f8b500;
            color: white;
            border: none;
            padding: 12px 20px;
            width: 100%;
            font-weight: bold;
            font-size: 1rem;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #e69500;
            transform: scale(1.03);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>
<body>
    <form action="AddMenuServlet" method="post">
        <label>Dish ID:</label>
        <input type="text" name="id">

        <label>Dish Name:</label>
        <input type="text" name="name">

        <label>Type:</label>
        <select name="type">
            <option>Veg</option>
            <option>Non-Veg</option>
        </select>

        <label>Price:</label>
        <input type="text" name="price">

        <label>Availability:</label>
        <input type="text" name="availability">

        <label>Image Name (e.g., paneer.jpg):</label>
        <input type="text" name="image_name">

        <input type="submit" value="Add Menu">
    </form>
</body>
</html>
