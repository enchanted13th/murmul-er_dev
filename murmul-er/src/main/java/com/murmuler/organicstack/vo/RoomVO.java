package com.murmuler.organicstack.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomVO implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private double area;
    private int floor;
    private int heatType;
    private String roomType;
    private int locationId;
}