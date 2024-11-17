<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Student" %>
<%@ page import="models.Course" %>
<%@ page import="dao.StudentDAO" %>
<%@ page import="dao.CourseDAO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>University Management System</title>
</head>
<body>
    <h1>University Management System</h1>

    <h2>Add Student</h2>
    <form action="addStudent" method="POST">
        <input type="text" name="name" placeholder="Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <button type="submit">Add Student</button>
    </form>

    <h2>Add Course</h2>
    <form action="addCourse" method="POST">
        <input type="text" name="course_name" placeholder="Course Name" required>
        <input type="number" name="credits" placeholder="Credits" required>
        <button type="submit">Add Course</button>
    </form>

    <h2>Enroll Student</h2>
    <form action="enrollStudent" method="POST">
        <select name="student_id" required>
            <option value="">Select Student</option>
            <%
                StudentDAO studentDAO = new StudentDAO();
                List<Student> students = studentDAO.getAllStudents();
                for (Student student : students) {
            %>
                <option value="<%= student.getId() %>"><%= student.getName() %></option>
            <%
                }
            %>
        </select>
        <select name="course_id" required>
            <option value="">Select Course</option>
            <%
                CourseDAO courseDAO = new CourseDAO();
                List<Course> courses = courseDAO.getAllCourses();
                for (Course course : courses) {
            %>
                <option value="<%= course.getId() %>"><%= course.getCourseName() %></option>
            <%
                }
            %>
        </select>
        <button type="submit">Enroll</button>
    </form>

    <h2>Record Attendance</h2>
    <form action="recordAttendance" method="POST">
        <select name="student_id" required>
            <option value="">Select Student</option>
            <%
                for (Student student : students) {
            %>
                <option value="<%= student.getId() %>"><%= student.getName() %></option>
            <%
                }
            %>
        </select>
        <select name="course_id" required>
            <option value="">Select Course</option>
            <%
                for (Course course : courses) {
            %>
                <option value="<%= course.getId() %>"><%= course.getCourseName() %></option>
            <%
                }
            %>
        </select>
        <input type="date" name="date" required>
        <select name="status" required>
            <option value="Present">Present</option>
            <option value="Absent">Absent</option>
        </select>
        <button type="submit">Record Attendance</button>
    </form>

    <h2>List of Students</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
        </tr>
        <%
            List<Student> allStudents = studentDAO.getAllStudents();
            for (Student student : allStudents) {
        %>
        <tr>
            <td><%= student.getId() %></td>
            <td><%= student.getName() %></td>
            <td><%= student.getEmail() %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
