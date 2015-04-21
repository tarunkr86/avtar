package avtar.vo;

import java.util.List;

import avtar.model.Agency;

public class AgencyListVO {

	private int pagesCount;
    private long totalAgencys;

    private String actionMessage;
    private String searchMessage;

    private List<Agency> agencys;

    public AgencyListVO() {
    }

    public AgencyListVO(int pages, long totalAgencys, List<Agency> agencys) {
        this.pagesCount = pages;
        this.agencys = agencys;
        this.totalAgencys = totalAgencys;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<Agency> getAgencys() {
        return agencys;
    }

    public void setAgencys(List<Agency> agencys) {
        this.agencys = agencys;
    }

    public long getTotalAgencys() {
        return totalAgencys;
    }

    public void setTotalAgencys(long totalAgencys) {
        this.totalAgencys = totalAgencys;
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
