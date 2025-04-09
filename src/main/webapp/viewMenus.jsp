<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com_prachal_Hotel.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Our Menu</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #fff6f0;
            --text-color: #2c3e50;
            --card-bg: #ffffff;
        }

        body.dark-mode {
            --bg-color: #1e1e1e;
            --text-color: #f0f0f0;
            --card-bg: #2c2c2c;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: var(--bg-color);
            color: var(--text-color);
            padding: 30px;
            transition: background 0.3s, color 0.3s;
        }

        h2 {
            text-align: center;
            font-size: 36px;
            margin-bottom: 20px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: auto;
            margin-bottom: 25px;
        }

        .filter-select {
            padding: 8px 12px;
            border-radius: 6px;
            font-size: 15px;
        }

        .toggle-btn {
            background: #222;
            color: #fff;
            padding: 8px 14px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            transition: background 0.3s;
        }

        .toggle-btn:hover {
            background: #444;
        }

        .cart-icon {
            position: relative;
            font-size: 24px;
            cursor: pointer;
        }

        .cart-badge {
            position: absolute;
            top: -8px;
            right: -12px;
            background: red;
            color: white;
            font-size: 12px;
            padding: 2px 6px;
            border-radius: 50%;
        }

        .cart-msg {
            text-align: center;
            font-size: 18px;
            color: green;
            margin: 10px 0;
        }

        .menu-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            max-width: 1200px;
            margin: auto;
        }

        .card {
            background: var(--card-bg);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            transition: transform 0.4s ease, box-shadow 0.4s ease, opacity 0.4s;
            opacity: 1;
            transform: scale(1);
            animation: fadeIn 0.5s ease;
        }

        .card.veg {
            border: 2px solid #2ecc71;
            box-shadow: 0 0 12px #2ecc71aa;
        }

        .card.non-veg {
            border: 2px solid #e74c3c;
            box-shadow: 0 0 12px #e74c3caa;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .info {
            padding: 18px;
        }

        .info h4 {
            font-size: 20px;
            margin-bottom: 6px;
        }

        .info p {
            font-size: 14px;
            margin: 3px 0;
        }

        .stars {
            color: gold;
            font-size: 14px;
            margin-top: 5px;
        }

        .btn {
            margin-top: 12px;
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(to right, #f39c12, #e67e22);
            color: white;
            font-weight: bold;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }

        .btn:hover {
            background: linear-gradient(to right, #e67e22, #d35400);
            transform: scale(1.05);
        }

        .btn:disabled {
            background: #aaa;
            cursor: not-allowed;
        }
    </style>

    <script>
        let itemCount = 0;

        function addToCart(button, itemName) {
            itemCount++;
            document.getElementById('msg').innerText = itemCount + " item(s) added to cart";
            document.getElementById('cart-count').innerText = itemCount;

            button.innerText = "✅ Added";
            button.disabled = true;

            let items = JSON.parse(sessionStorage.getItem("cartItems") || "[]");
            items.push(itemName);
            sessionStorage.setItem("cartItems", JSON.stringify(items));

            setTimeout(() => {
                if (confirm("🛒 Proceed to checkout?")) {
                    window.location.href = "checkout.jsp";
                }
            }, 600);
        }

        function toggleDarkMode() {
            document.body.classList.toggle("dark-mode");
        }

        function filterMenu() {
            const filter = document.getElementById("filter").value.toLowerCase();
            const cards = document.querySelectorAll(".card");

            cards.forEach(card => {
                const type = card.getAttribute("data-type").toLowerCase();
                card.classList.remove("veg", "non-veg");

                if (filter === "all" || type === filter) {
                    card.style.display = "block";
                    card.style.opacity = "0";
                    setTimeout(() => {
                        card.style.opacity = "1";
                        card.classList.add(type === "veg" ? "veg" : "non-veg");
                    }, 50);
                } else {
                    card.style.opacity = "0";
                    setTimeout(() => {
                        card.style.display = "none";
                    }, 300);
                }
            });
        }
    </script>
</head>
<body>

    <h2>🍽️ Our Special Menu</h2>

    <div class="top-bar">
        <select id="filter" class="filter-select" onchange="filterMenu()">
            <option value="all">Show All</option>
            <option value="veg">Veg</option>
            <option value="non-veg">Non-Veg</option>
        </select>

        <div class="cart-icon" onclick="window.location.href='checkout.jsp'">
            🛒 <span class="cart-badge" id="cart-count">0</span>
        </div>

        <div class="toggle-btn" onclick="toggleDarkMode()">🌓 Toggle Dark Mode</div>
    </div>

    <div id="msg" class="cart-msg"></div>

    <div class="menu-container">
        <%
        List<MenuItem> menuList = (List<MenuItem>) request.getAttribute("menuList");
        Random rand = new Random();
        if(menuList != null) {
            for(MenuItem m : menuList) {
                int stars = 3 + rand.nextInt(3); // 3 to 5 stars
        %>
        <div class="card" data-type="<%= m.getType() %>">
            <img src="images/<%= m.getImageName() %>" alt="dish">
            <div class="info">
                <h4><%= m.getName() %></h4>
                <p><strong>Type:</strong> <%= m.getType() %></p>
                <p><strong>Price:</strong> ₹<%= m.getPrice() %></p>
                <p><strong>Available:</strong> <%= m.getAvailability() %></p>
                <div class="stars">
                    <% for (int i = 0; i < stars; i++) { %>★<% } %>
                    <% for (int i = stars; i < 5; i++) { %>☆<% } %>
                </div>
                <button class="btn" onclick="addToCart(this, '<%= m.getName() %>')">Add to Cart</button>
            </div>
        </div>
        <% } } %>
    </div>

</body>
</html>
