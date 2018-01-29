package datas;

/**
 * Created by Serik on 12.12.2015.
 */
public class SourceDataRow {
    private int Year;
    private String Sector;
    private String OblasctCode;
    private String Project;
    private String ProjectNomer;
    private String Description;
    private double PlanValue;
    private double FactValue;

    public int getYear() {
        return Year;
    }

    public void setYear(int year) {
        Year = year;
    }

    public String getSector() {
        return Sector;
    }

    public void setSector(String sector) {
        Sector = sector;
    }

    public String getOblasctCode() {
        return OblasctCode;
    }

    public void setOblasctCode(String oblasctCode) {
        OblasctCode = oblasctCode;
    }

    public String getProject() {
        return Project;
    }

    public void setProject(String project) {
        Project = project;
    }

    public String getProjectNomer() {
        return ProjectNomer;
    }

    public void setProjectNomer(String projectNomer) {
        ProjectNomer = projectNomer;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public double getPlanValue() {
        return PlanValue;
    }

    public void setPlanValue(double planValue) {
        PlanValue = planValue;
    }

    public double getFactValue() {
        return FactValue;
    }

    public void setFactValue(double factValue) {
        FactValue = factValue;
    }
}
