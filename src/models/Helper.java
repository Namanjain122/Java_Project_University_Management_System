try (Connection conn = Helper.getConnection()) {
    // Your database operations here
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    Helper.closeResources(conn); // Close resources if needed
}
