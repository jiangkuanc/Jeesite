package com.dagongsoft.p2p.financing.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

/**
 * 资料填写时间Entity
 *
 * @author Zach
 * @version 2016-10-26
 */
public class RateDataWriteTime extends DataEntity<RateDataWriteTime> {

    private static final long serialVersionUID = 1L;
    private String projectId;        // project_id
    private String workingPapersId;        // working_papers_id
    private String oneIssueTime;        // one_issue_time
    private String firstYear;        // first_year
    private String secondYear;        // second_year
    private String thirdYear;        // third_year
    private String fourthYear;        //第4年
    private String businessScope;//业务范围


    public RateDataWriteTime() {
        super();
    }

    public RateDataWriteTime(String id) {
        super(id);
    }

    @Length(min = 0, max = 36, message = "project_id长度必须介于 0 和 36 之间")
    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    @Length(min = 0, max = 36, message = "working_papers_id长度必须介于 0 和 36 之间")
    public String getWorkingPapersId() {
        return workingPapersId;
    }

    public void setWorkingPapersId(String workingPapersId) {
        this.workingPapersId = workingPapersId;
    }

    @Length(min = 0, max = 20, message = "one_issue_time长度必须介于 0 和 20 之间")
    public String getOneIssueTime() {
        return oneIssueTime;
    }

    public void setOneIssueTime(String oneIssueTime) {
        this.oneIssueTime = oneIssueTime;
    }

    @Length(min = 0, max = 20, message = "first_year长度必须介于 0 和 20 之间")
    public String getFirstYear() {
        return firstYear;
    }

    public void setFirstYear(String firstYear) {
        this.firstYear = firstYear;
    }

    @Length(min = 0, max = 20, message = "second_year长度必须介于 0 和 20 之间")
    public String getSecondYear() {
        return secondYear;
    }

    public void setSecondYear(String secondYear) {
        this.secondYear = secondYear;
    }

    @Length(min = 0, max = 20, message = "third_year长度必须介于 0 和 20 之间")
    public String getThirdYear() {
        return thirdYear;
    }

    public void setThirdYear(String thirdYear) {
        this.thirdYear = thirdYear;
    }

    public String getFourthYear() {
        return fourthYear;
    }

    public void setFourthYear(String fourthYear) {
        this.fourthYear = fourthYear;
    }

    public String getBusinessScope() {
        return businessScope;
    }

    public void setBusinessScope(String businessScope) {
        this.businessScope = businessScope;
    }


}