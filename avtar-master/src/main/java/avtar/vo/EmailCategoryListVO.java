package avtar.vo;

import java.util.List;

import avtar.model.EmailCategory;

public class EmailCategoryListVO {

	private int pagesCount;
    private long totalEmailCategorys;

    private String actionMessage;
    private String searchMessage;

    private List<EmailCategory> emailCategorys;

    public EmailCategoryListVO() {
    }

    public EmailCategoryListVO(int pages, long totalEmailCategorys, List<EmailCategory> emailCategorys) {
        this.pagesCount = pages;
        this.emailCategorys = emailCategorys;
        this.totalEmailCategorys = totalEmailCategorys;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<EmailCategory> getEmailCategorys() {
        return emailCategorys;
    }

    public void setEmailCategorys(List<EmailCategory> emailCategorys) {
        this.emailCategorys = emailCategorys;
    }

    public long getTotalEmailCategorys() {
        return totalEmailCategorys;
    }

    public void setTotalEmailCategorys(long totalEmailCategorys) {
        this.totalEmailCategorys = totalEmailCategorys;
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
