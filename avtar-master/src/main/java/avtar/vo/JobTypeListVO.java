package avtar.vo;

import java.util.List;

import avtar.model.JobType;

public class JobTypeListVO {

	private int pagesCount;
    private long totalJobTypes;

    private String actionMessage;
    private String searchMessage;

    private List<JobType> jobTypes;

    public JobTypeListVO() {
    }

    public JobTypeListVO(int pages, long totalJobTypes, List<JobType> jobTypes) {
        this.pagesCount = pages;
        this.jobTypes = jobTypes;
        this.totalJobTypes = totalJobTypes;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<JobType> getJobTypes() {
        return jobTypes;
    }

    public void setJobTypes(List<JobType> jobTypes) {
        this.jobTypes = jobTypes;
    }

    public long getTotalJobTypes() {
        return totalJobTypes;
    }

    public void setTotalJobTypes(long totalJobTypes) {
        this.totalJobTypes = totalJobTypes;
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
