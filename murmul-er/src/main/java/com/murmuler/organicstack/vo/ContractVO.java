package com.murmuler.organicstack.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContractVO implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private int roomId;
    private int sublessorId;
    private int sublesseeId;
    private String contractForm;
    private Date contractDate;
    private int deposit;
    private int monthlyCost;
    private String stayFrom;
    private String stayTo;
    private String address;
    private String rentType;
}
