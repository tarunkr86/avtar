package avtar.vo;

import java.util.List;

import avtar.model.Company;
import avtar.model.CompanyLocation;

public class LocationListVO {
    private int pagesCount;
    private long totalLocations;

    private String actionMessage;
    private String searchMessage;

    private List<CompanyLocation> locations;

    public LocationListVO() {
    }

    public LocationListVO(int pages, long totalLocations, List<CompanyLocation> locations) {
        this.pagesCount = pages;
        this.locations = locations;
        this.totalLocations = totalLocations;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<CompanyLocation> getLocations() {
        return locations;
    }

    public void setLocations(List<CompanyLocation> locations) {
        this.locations = locations;
    }

    public long getTotalLocations() {
        return totalLocations;
    }

    public void setTotalLocations(long totalLocations) {
        this.totalLocations = totalLocations;
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
