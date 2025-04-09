<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        label {
            display: block;
            margin: 15px 0 5px;
            color: #333;
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .btn {
            background-color: #e74c3c;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            width: 100%;
            margin-top: 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background-color: #c0392b;
        }

        .success-message {
            text-align: center;
            margin-top: 20px;
            color: green;
            font-weight: bold;
            display: none;
            animation: fadeIn 1s ease;
        }

        .home-btn {
            margin-top: 15px;
            display: none;
            text-align: center;
        }

        .home-btn a {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .home-btn a:hover {
            background-color: #2980b9;
        }

        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Delivery Details</h2>
    <form onsubmit="placeOrder(event)">
        <label>Delivery Address</label>
        <input type="text" name="address" required>

        <label>Phone Number</label>
        <input type="text" name="phone" required>

        <label>Payment Mode</label>
        <select name="payment">
            <option>Cash on Delivery</option>
            <option>UPI</option>
            <option>Credit/Debit Card</option>
        </select>

        <button type="submit" class="btn">Place Order</button>
    </form>

    <div class="success-message" id="successMsg">
        ✅ Thank you! Your order is being prepared and will be delivered soon.
    </div>

    <div class="home-btn" id="homeLink">
        <a href="index.jsp">Go to Home</a>
    </div>
</div>

<script>
    function placeOrder(event) {
        event.preventDefault();
        document.getElementById("successMsg").style.display = "block";
        document.getElementById("homeLink").style.display = "block";
    }
</script>

</body>
</html>
