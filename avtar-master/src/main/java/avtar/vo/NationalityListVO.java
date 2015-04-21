package avtar.vo;

import java.util.List;

import avtar.model.Nationality;

public class NationalityListVO {

	private int pagesCount;
    private long totalNationalitys;

    private String actionMessage;
    private String searchMessage;

    private List<Nationality> nationalitys;

    public NationalityListVO() {
    }

    public NationalityListVO(int pages, long totalNationalitys, List<Nationality> nationalitys) {
        this.pagesCount = pages;
        this.nationalitys = nationalitys;
        this.totalNationalitys = totalNationalitys;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<Nationality> getNationalitys() {
        return nationalitys;
    }

    public void setNationalitys(List<Nationality> nationalitys) {
        this.nationalitys = nationalitys;
    }

    public long getTotalNationalitys() {
        return totalNationalitys;
    }

    public void setTotalNationalitys(long totalNationalitys) {
        this.totalNationalitys = totalNationalitys;
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
