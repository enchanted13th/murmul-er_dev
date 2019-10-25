package com.murmuler.organicstack.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SaleInfoVO implements Serializable {
    private static final long serialVersionUID = 1L;
    private int roomId;
    private String title;
    private int rentType;
    private int periodNum;
    private String periodUnit;
    private int postType;
    private int deposit;
    private int monthlyCost;
    private int manageCost;
    private String hashtagExist;
    private Date writeDate;
    private int views;
    private String detailExplain;
    private int memberId;
}