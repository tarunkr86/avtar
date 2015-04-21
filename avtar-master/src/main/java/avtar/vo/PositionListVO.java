package avtar.vo;


import java.util.List;

import avtar.model.Position;

public class PositionListVO {
    private int pagesCount;
    private long totalPositions;

    private String actionMessage;
    private String searchMessage;

    private List<Position> positions;

    public PositionListVO() {
    }

    public PositionListVO(int pages, long totalPositions, List<Position> positions) {
        this.pagesCount = pages;
        this.positions = positions;
        this.totalPositions = totalPositions;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<Position> getPositions() {
        return positions;
    }

    public void setPositions(List<Position> positions) {
        this.positions = positions;
    }

    public long getTotalPositions() {
        return totalPositions;
    }

    public void setTotalPositions(long totalPositions) {
        this.totalPositions = totalPositions;
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