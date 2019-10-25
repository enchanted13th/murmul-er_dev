package com.murmuler.organicstack.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MessageVO implements Serializable {
    private static final long serialVersionUID = 1L;
    private String talkRoomId;
    private String sender;
    private String receiver;
    private String content;
    private String type;
    private String date;
    private String time;

    @Override
    public String toString() {
        return "{" +
                "talkRoomId:\"" + talkRoomId + "\"" +
                ", sender:\"" + sender + "\"" +
                ", receiver:\"" + receiver + "\"" +
                ", content:\"" + content + "\"" +
                ", type:\"" + type + "\"" +
                ", date:\"" + date + "\"" +
                ", time:\"" + time + "\"" +
                "}";
    }

}
