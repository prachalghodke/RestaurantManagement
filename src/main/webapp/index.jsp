<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #d4fc79, #96e6a1);
            margin: 0;
            padding: 50px;
            text-align: center;
        }

        h2 {
            color: #2e7d32;
            font-size: 2.5rem;
            animation: slideDown 0.7s ease-in-out;
        }

        a {
            display: inline-block;
            margin: 20px 15px;
            padding: 12px 30px;
            text-decoration: none;
            font-size: 1rem;
            font-weight: bold;
            color: #fff;
            background-color: #43a047;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            transition: background-color 0.3s, transform 0.3s;
            animation: fadeInUp 1s ease-in-out;
        }

        a:hover {
            background-color: #2e7d32;
            transform: scale(1.05);
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 600px) {
            a {
                display: block;
                width: 80%;
                margin: 15px auto;
            }
        }
    </style>
</head>
<body>
    <h2>Welcome to Hotel Management System</h2>
    <a href="add_menu.jsp">Add Menu</a>
    <a href="ViewServlet">View Menu</a>
</body>
</html>
