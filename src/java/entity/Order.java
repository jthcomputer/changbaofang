package entity;


import javax.xml.crypto.Data;

public class Order {
    public  int order_id;
    public  String order_userid;
    public  String order_hotelid;
    public  Data order_checktime;
    public  Data order_leavetime;
    public  String order_status;    //订单状态：0：驳回 _：通过 2：未审批
    public  String order_evaluate;  //评价
    public  int order_price;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getOrder_userid() {
        return order_userid;
    }

    public void setOrder_userid(String order_userid) {
        this.order_userid = order_userid;
    }

    public String getOrde_rhotelid() {
        return order_hotelid;
    }

    public void setOrder_hotelid(String order_hotelid) {
        this.order_hotelid = order_hotelid;
    }

    public Data getOrder_checktime() {
        return order_checktime;
    }

    public void setOrder_checktime(Data order_checktime) {
        this.order_checktime = order_checktime;
    }

    public Data getOrder_leavetime() {
        return order_leavetime;
    }

    public void setOrder_leavetime(Data order_leavetime) {
        this.order_leavetime = order_leavetime;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

    public String getOrder_evaluate() {
        return order_evaluate;
    }

    public void setOrder_evaluate(String order_evaluate) {
        this.order_evaluate = order_evaluate;
    }

    public int getOrder_price() {
        return order_price;
    }

    public void setOrder_price(int order_price) {
        this.order_price = order_price;
    }
}
