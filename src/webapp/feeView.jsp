<%@ page import="java.util.List" %>
<%@ page import="your.package.FeeStructure" %>
<%@ page import="your.package.FeeStructureDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Fee Structures</title>
</head>
<body>
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
</body>
</html>
