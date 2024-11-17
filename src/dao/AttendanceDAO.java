package dao;

import models.Attendance;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDAO {
    public void recordAttendance(Attendance attendance) {
        String sql = "INSERT INTO attendance (student_id, course_id, date, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, attendance.getStudentId());
            pstmt.setInt(2, attendance.getCourseId());
            pstmt.setDate(3, new java.sql.Date(attendance.getDate().getTime()));
            pstmt.setString(4, attendance.getStatus());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
