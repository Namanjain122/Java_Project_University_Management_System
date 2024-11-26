<%@ page import="java.util.List" %>
<%@ page import="your.package.FeeStructure" %>
<%@ page import="your.package.FeeStructureDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Fee Structures</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        h2 {
            margin-top: 40px;
            color: #333;
        }

        form {
            margin: 20px auto;
            padding: 20px;
            max-width: 400px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        form input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        form button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        form button:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #4CAF50;
            color: white;
        }

        table td button {
            padding: 6px 12px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        table td button:hover {
            background-color: #e53935;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Manage Fee Structures</h1>
        <form action="manageFees" method="POST">
            <input type="text" name="courseName" placeholder="Course Name" required>
            <input type="number" name="tuitionFee" placeholder="Tuition Fee" required>
            <input type="number" name="labFee" placeholder="Lab Fee" required>
            <input type="number" name="libraryFee" placeholder="Library Fee" required>
            <button type="submit" name="action" value="add">Add Fee Structure</button>
        </form>

        <h2>Existing Fee Structures</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Course Name</th>
                <th>Tuition Fee</th>
                <th>Lab Fee</th>
                <th>Library Fee</th>
                <th>Total Fee</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="fee" items="${feeStructures}">
                <tr>
                    <td>${fee.id}</td>
                    <td>${fee.courseName}</td>
                    <td>${fee.tuitionFee}</td>
                    <td>${fee.labFee}</td>
                    <td>${fee.libraryFee}</td>
                    <td>${fee.totalFee}</td>
                    <td>
                        <form action="manageFees" method="POST">
                            <input type="hidden" name="id" value="${fee.id}">
                            <button type="submit" name="action" value="delete">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
