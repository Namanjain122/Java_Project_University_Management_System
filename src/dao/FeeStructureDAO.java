package dao; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FeeStructureDAO {

    // Method to add a new fee structure
    public void addFeeStructure(Connection conn, FeeStructure feeStructure) throws SQLException {
        String sql = "INSERT INTO fee_structure (course_name, tuition_fee, lab_fee, library_fee, total_fee) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, feeStructure.getCourseName());
            stmt.setDouble(2, feeStructure.getTuitionFee());
            stmt.setDouble(3, feeStructure.getLabFee());
            stmt.setDouble(4, feeStructure.getLibraryFee());
            stmt.setDouble(5, feeStructure.getTotalFee());
            stmt.executeUpdate();
        }
    }

    // Method to get all fee structures
    public List<FeeStructure> getAllFeeStructures(Connection conn) throws SQLException {
        List<FeeStructure> feeStructures = new ArrayList<>();
        String sql = "SELECT * FROM fee_structure";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                FeeStructure feeStructure = new FeeStructure(
                        rs.getInt("id"),
                        rs.getString("course_name"),
                        rs.getDouble("tuition_fee"),
                        rs.getDouble("lab_fee"),
                        rs.getDouble("library_fee")
                );
                feeStructures.add(feeStructure);
            }
        }
        return feeStructures;
    }

    // Method to update an existing fee structure
    public void updateFeeStructure(Connection conn, FeeStructure feeStructure) throws SQLException {
        String sql = "UPDATE fee_structure SET course_name=?, tuition_fee=?, lab_fee=?, library_fee=?, total_fee=? WHERE id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, feeStructure.getCourseName());
            stmt.setDouble(2, feeStructure.getTuitionFee());
            stmt.setDouble(3, feeStructure.getLabFee());
            stmt.setDouble(4, feeStructure.getLibraryFee());
            stmt.setDouble(5, feeStructure.getTotalFee());
            stmt.setInt(6, feeStructure.getId());
            stmt.executeUpdate();
        }
    }

    // Method to delete a fee structure by ID
    public void deleteFeeStructure(Connection conn, int id) throws SQLException {
        String sql = "DELETE FROM fee_structure WHERE id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    // Method to get a fee structure by ID
    public FeeStructure getFeeStructureById(Connection conn, int id) throws SQLException {
        FeeStructure feeStructure = null;
        String sql = "SELECT * FROM fee_structure WHERE id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    feeStructure = new FeeStructure(
                            rs.getInt("id"),
                            rs.getString("course_name"),
                            rs.getDouble("tuition_fee"),
                            rs.getDouble("lab_fee"),
                            rs.getDouble("library_fee")
                    );
                }
            }
        }
        return feeStructure;
    }
}
