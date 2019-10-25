package com.murmuler.organicstack.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InquiryVO implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String email;
    private String content;
    private Date writeDate;
    private int processId;
}
