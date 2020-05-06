package entity;
import javax.xml.crypto.Data;

public class SellOrder {
    public  int sellorder_id;
    public  String sellorder_userid;
    public  String sellorder_sellid;
    public  String sellorder_status;    //房源状态：0：驳回 _：通过 2：未审批
    public  int order_price;
    public  int getSellOrder_id() {
        return sellorder_id;
    }

    public void setSellOrder_id(int sellorder_id) {
        this.sellorder_id = sellorder_id;
    }

    public String getSellOrder_userid() {
        return sellorder_userid;
    }

    public void setSellOrder_userid(String sellorder_userid) {
        this.sellorder_userid = sellorder_userid;
    }

    public String getSellOrde_rsellid() {
        return sellorder_sellid;
    }

    public void setSellOrder_sellid(String sellorder_sellid) {
        this.sellorder_sellid = sellorder_sellid;
    }

    public String getSellOrder_status() {
        return sellorder_status;
    }

    public void setSellOrder_status(String sellorder_status) {
        this.sellorder_status = sellorder_status;
    }

    public int getSellOrder_price() {
       return sellorder_price;
    }

    public void setSellOrder_price(int sellorder_price) {
        this.sellorder_price =sellorder_price;
    }
}
