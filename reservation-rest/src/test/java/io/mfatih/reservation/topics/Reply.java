package io.mfatih.reservation.topics;

public class Reply {

    private String messsage;

    public Reply() {
    }

    public Reply(String replyMesssage) {
        this.messsage = replyMesssage;
    }

    public String getMesssage() {
        return messsage;
    }

    public void setMesssage(String messsage) {
        this.messsage = messsage;
    }
}
