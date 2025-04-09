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
        background: linear-gradient(to right, #e3f2fd, #ffffff);
        margin: 0;
        padding: 50px;
        text-align: center;
    }

    h2 {
        color: #0d6efd;
        font-size: 2.5rem;
        animation: fadeInDown 0.8s ease-in-out;
    }

    a {
        display: inline-block;
        margin: 20px;
        padding: 12px 25px;
        text-decoration: none;
        font-size: 1rem;
        font-weight: 600;
        color: #fff;
        background-color: #0d6efd;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        transition: background-color 0.3s, transform 0.3s;
        animation: fadeInUp 1s ease-in-out;
    }

    a:hover {
        background-color: #084298;
        transform: scale(1.05);
    }

    @keyframes fadeInDown {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @media (max-width: 600px) {
        a {
            display: block;
            margin: 15px auto;
            width: 70%;
        }
    }
</style>
</head>
<body>
	<h2>Welcome to Hotel Management System</h2>
    <a href="add_menu.jsp">Add Menu</a>
    <a href="view_menu.jsp">View Menu</a>
</body>
</html>
