package servlet;

import com.alibaba.fastjson.JSON;
import dao.SellOrderDao;
import entity.SellOrder;
import entity.Sell;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class SellOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF8");
        //得到所有订单信息
        ArrayList<SellOrder> sellorderArrayList = new SellOrderDao().getAllSellOrder();
        String jsonStr = JSON.toJSONString(sellorderArrayList);
        PrintWriter writer = resp.getWriter();
        writer.write(jsonStr);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF8");

        String type = req.getParameter("type");
        int sellorder_id = Integer.parseInt(req.getParameter("sellorder_id"));
        String sellorder_userid = req.getParameter("sellorder_userid");
        String sellorder_sellid = req.getParameter("sellorder_sellid");

        String sellorder_status = req.getParameter("sellorder_status");

        int sellorder_price = Integer.parseInt(req.getParameter("sellorder_price"));

        if ("1".equals(type)) {
            //添加订单
            if (new SellOrderDao().addSellOrder(sellorder_id, sellorder_userid, sellorder_sellid, sellorder_status, sellorder_price)) {
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }
        } else if ("2".equals(type)) {
            //删除订单
            if (new SellOrderDao().deleteSellOrder(sellorder_id)) {
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }
        } else if ("3".equals(type)) {
            //更改订单状态
            if (new SellOrderDao().updateSellOrder_status(sellorder_id, sellorder_status)) {
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }
        }
//        else if("4".equals(type)){
//            //写评价
//            if(new SellOrderDao().addSellOrder_evaluate(sellorder_id,sellorder_userid,sellorder_sellid,sellorder_checktime,sellorder_leavetime,sellorder_status,sellorder_evaluate,sellorder_price)){
//                String jsonStr = JSON.toJSONString("true");
//                PrintWriter writer = resp.getWriter();
//                writer.write(jsonStr);
//            }
//
//        }
        else if ("5".equals(type)) {
            //求某个酒店的所有信息
            SellOrder sellorder = new SellOrderDao().getSellOrder(sellorder_id);
            String jsonStr = JSON.toJSONString(sellorder);
            PrintWriter writer = resp.getWriter();
            writer.write(jsonStr);
        }
        else if ("6".equals(type)) {
            //写入订单成交额
            if (new SellOrderDao().updateSellOrder_price(sellorder_id, sellorder_price)) {
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);

            }
        }
        else if ("7".equals(type)) {
            //求某个用户的所有订单 用户！
            SellOrder sellorder1 = new SellOrderDao().getUserSellOrder(sellorder_userid);
            String jsonStr = JSON.toJSONString(sellorder1);
            PrintWriter writer = resp.getWriter();
            writer.write(jsonStr);
        }
    }
}
