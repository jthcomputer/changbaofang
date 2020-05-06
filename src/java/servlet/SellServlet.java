package servlet;

import com.alibaba.fastjson.JSON;
import dao.SellDao;
import entity.Sell;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;



public class SellServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF8");
        //得到所有房子信息
        ArrayList<Sell> sellArrayList=new SellDao().getAllSell();
        String jsonStr = JSON.toJSONString(sellArrayList);
        PrintWriter writer = resp.getWriter();
        writer.write(jsonStr);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF8");
        int sellid = Integer.parseInt(req.getParameter("sellid"));
        String sellcity = req.getParameter("sellcity");
        String sellname = req.getParameter("sellname");

        String sellindex = req.getParameter("sellindex");
        String sellcall = req.getParameter("sellcall");
        String sellstatus = req.getParameter("sellstatus");
        String type = req.getParameter("type");
        int sellroomnum = Integer.parseInt(req.getParameter("sellroomnum"));
        int sellprice = Integer.parseInt(req.getParameter("sellprice"));
        String sellpic = req.getParameter("sellpic");

        if("1".equals(type)) {
            //删除房子
            if (new SellDao().deleteSell(sellid)) {
               String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }
        }

        else if("2".equals(type)){
            //添加房子
            if(new SellDao().addSell(sellid,sellname,sellcity,sellstatus,sellindex,sellcall,sellroomnum,sellprice)){
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }

        }
        else if ("3".equals(type)){
            //更改房子
            if(new SellDao().updateSell(sellid,sellname,sellcity,sellindex,sellcall,sellroomnum,sellprice)){

                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }

        }
        else if ("4".equals(type)){
            //得到某个房子的具体信息
            Sell sell = new SellDao().getOneSell(sellid);
            String jsonStr = JSON.toJSONString(sell);
            PrintWriter writer = resp.getWriter();
            writer.write(jsonStr);
        }

    }

}
