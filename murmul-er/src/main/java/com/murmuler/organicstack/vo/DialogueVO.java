package com.murmuler.organicstack.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DialogueVO implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private int sublessorId;
    private int sublesseeId;
    private String contentFileURL;
}
