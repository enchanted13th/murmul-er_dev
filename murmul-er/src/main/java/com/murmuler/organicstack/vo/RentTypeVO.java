package com.murmuler.organicstack.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RentTypeVO implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String name;
}
