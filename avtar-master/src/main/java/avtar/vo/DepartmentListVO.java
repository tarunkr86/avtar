package avtar.vo;

import java.util.List;

import avtar.model.Company;
import avtar.model.CompanyDepartment;

public class DepartmentListVO {
    private int pagesCount;
    private long totalDepartments;

    private String actionMessage;
    private String searchMessage;

    private List<CompanyDepartment> departments;

    public DepartmentListVO() {
    }

    public DepartmentListVO(int pages, long totalDepartments, List<CompanyDepartment> departments) {
        this.pagesCount = pages;
        this.departments = departments;
        this.totalDepartments = totalDepartments;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<CompanyDepartment> getDepartments() {
        return departments;
    }

    public void setDepartments(List<CompanyDepartment> departments) {
        this.departments = departments;
    }

    public long getTotalDepartments() {
        return totalDepartments;
    }

    public void setTotalDepartments(long totalDepartments) {
        this.totalDepartments = totalDepartments;
    }

    public String getActionMessage() {
        return actionMessage;
    }

    public void setActionMessage(String actionMessage) {
        this.actionMessage = actionMessage;
    }

    public String getSearchMessage() {
        return searchMessage;
    }

    public void setSearchMessage(String searchMessage) {
        this.searchMessage = searchMessage;
    }
}
