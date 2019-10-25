package com.murmuler.organicstack.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomTypeVO implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;
    private String name;
}
