package com.murmuler.organicstack.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomSummaryViewVO implements Serializable {
    private static final long serialVersionUID = 1L;
    private int roomId;
    private BigDecimal latitude;
    private BigDecimal longitude;
    private String postType;
    private String title;
    private String sido;
    private String sigungu;
    private String roadname;
    private int periodNum;
    private String periodUnit;
    private String roomType;
    private String rentType;
    private double area;
    private String deposit;
    private String monthlyCost;
    private String manageCost;
    private Date writeDate;
    private int views;
    private String roomImg;
}
