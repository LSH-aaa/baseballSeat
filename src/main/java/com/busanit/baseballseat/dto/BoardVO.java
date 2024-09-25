package com.busanit.baseballseat.dto;

import java.sql.Timestamp;

public class BoardVO {
    public int num;
    public String type;
    public String title;
    public String content;
    public int readcount;
    public Timestamp writedate;
    public String nickname;
    public String id;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getReadcount() {
        return readcount;
    }

    public void setReadcount(int readcount) {
        this.readcount = readcount;
    }

    public Timestamp getWritedate() {
        return writedate;
    }

    public void setWritedate(Timestamp writedate) {
        this.writedate = writedate;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
