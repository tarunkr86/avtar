package avtar.vo;


import java.util.List;

import avtar.model.Company;

public class CompanyListVO {
    private int pagesCount;
    private long totalCompanys;

    private String actionMessage;
    private String searchMessage;

    private List<Company> companys;

    public CompanyListVO() {
    }

    public CompanyListVO(int pages, long totalCompanys, List<Company> companys) {
        this.pagesCount = pages;
        this.companys = companys;
        this.totalCompanys = totalCompanys;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<Company> getCompanys() {
        return companys;
    }

    public void setCompanys(List<Company> companys) {
        this.companys = companys;
    }

    public long getTotalCompanys() {
        return totalCompanys;
    }

    public void setTotalCompanys(long totalCompanys) {
        this.totalCompanys = totalCompanys;
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