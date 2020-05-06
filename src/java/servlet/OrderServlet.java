package servlet;

import com.alibaba.fastjson.JSON;
import dao.OrderDao;
import entity.Order;
import entity.Hotel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF8");
        //得到所有订单信息
        ArrayList<Order> orderArrayList = new OrderDao().getAllOrder();
        String jsonStr = JSON.toJSONString(orderArrayList);
        PrintWriter writer = resp.getWriter();
        writer.write(jsonStr);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF8");

        String type = req.getParameter("type");
        int order_id = Integer.parseInt(req.getParameter("order_id"));
        String order_userid = req.getParameter("order_userid");
        String order_hotelid = req.getParameter("order_hotelid");
        String order_checktime = req.getParameter("order_checktime");
        String order_leavetime = req.getParameter("order_leavetime");
        String order_status = req.getParameter("order_status");
        String order_evaluate = req.getParameter("order_evaluate");
        int order_price = Integer.parseInt(req.getParameter("order_price"));

        if ("1".equals(type)) {
            //添加订单
            if (new OrderDao().addOrder(order_id, order_userid, order_hotelid, order_checktime, order_leavetime, order_status, order_evaluate, order_price)) {
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }
        } else if ("2".equals(type)) {
            //删除订单
            if (new OrderDao().deleteOrder(order_id)) {
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }
        } else if ("3".equals(type)) {
            //更改订单状态
            if (new OrderDao().updateOrder_status(order_id, order_status)) {
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }
        }
//        else if("4".equals(type)){
//            //写评价
//            if(new OrderDao().addOrder_evaluate(order_id,order_userid,order_hotelid,order_checktime,order_leavetime,order_status,order_evaluate,order_price)){
//                String jsonStr = JSON.toJSONString("true");
//                PrintWriter writer = resp.getWriter();
//                writer.write(jsonStr);
//            }
//
//        }
        else if ("5".equals(type)) {
            //求某个酒店的所有信息
            Order order = new OrderDao().getOrder(order_id);
            String jsonStr = JSON.toJSONString(order);
            PrintWriter writer = resp.getWriter();
            writer.write(jsonStr);
        }
        else if ("6".equals(type)) {
            //写入订单成交额
            if (new OrderDao().updateOrder_price(order_id, order_price)) {
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);

            }


        }
        else if ("7".equals(type)) {
            //求某个用户的所有订单 用户！
            Order order1 = new OrderDao().getUserOrder(order_userid);
            String jsonStr = JSON.toJSONString(order1);
            PrintWriter writer = resp.getWriter();
            writer.write(jsonStr);
        }
    }
}
