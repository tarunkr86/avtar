package avtar.vo;

import java.util.List;

import avtar.model.EmailTemplate;

public class EmailTemplateListVO {

	private int pagesCount;
    private long totalEmailTemplates;

    private String actionMessage;
    private String searchMessage;

    private List<EmailTemplate> emailTemplates;

    public EmailTemplateListVO() {
    }

    public EmailTemplateListVO(int pages, long totalEmailTemplates, List<EmailTemplate> emailTemplates) {
        this.pagesCount = pages;
        this.emailTemplates = emailTemplates;
        this.totalEmailTemplates = totalEmailTemplates;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<EmailTemplate> getEmailTemplates() {
        return emailTemplates;
    }

    public void setEmailTemplates(List<EmailTemplate> emailTemplates) {
        this.emailTemplates = emailTemplates;
    }

    public long getTotalEmailTemplates() {
        return totalEmailTemplates;
    }

    public void setTotalEmailTemplates(long totalEmailTemplates) {
        this.totalEmailTemplates = totalEmailTemplates;
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
