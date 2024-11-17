public class FeeStructure {
    private int id;
    private String courseName;
    private double tuitionFee;
    private double labFee;
    private double libraryFee;
    private double totalFee;

    // Constructor
    public FeeStructure(int id, String courseName, double tuitionFee, double labFee, double libraryFee) {
        this.id = id;
        this.courseName = courseName;
        this.tuitionFee = tuitionFee;
        this.labFee = labFee;
        this.libraryFee = libraryFee;
        this.totalFee = tuitionFee + labFee + libraryFee;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public String getCourseName() {
        return courseName;
    }

    public double getTuitionFee() {
        return tuitionFee;
    }

    public double getLabFee() {
        return labFee;
    }

    public double getLibraryFee() {
        return libraryFee;
    }

    public double getTotalFee() {
        return totalFee;
    }
}
