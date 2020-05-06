package servlet;

import dao.ComplainDao;
import entity.Complain;
import com.alibaba.fastjson.JSON;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class ComplainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF8");

        ArrayList<Complain> complainArrayList= new ComplainDao().getAllComplain();
        String jsonStr = JSON.toJSONString(complainArrayList);
        PrintWriter writer = resp.getWriter();
        writer.write(jsonStr);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF8");

        int complainid = Integer.parseInt(req.getParameter("conplianid"));
        String complainstatus = req.getParameter("complainstatus");
        String complainreply = req.getParameter("complainreply");
        String type = req.getParameter("type");
        if ("1".equals(type)){
            //删除投诉
            if(new ComplainDao().deleteComplain(complainid)){
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }
        }
        else if ("2".equals(type)){
            //回复
            if(new ComplainDao().addComplainReply(complainid,complainreply)){
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }
        }
        else if ("3".equals(type)){
            //得到某个投诉
            Complain complain = new ComplainDao().getOneComplain(complainid);
                String jsonStr = JSON.toJSONString(complain);
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);

        }
        else  if ("4".equals(type)){
            //更改投诉状态
            if (new ComplainDao().updateComplainStatus(complainid,complainstatus)){
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }
        }
    }
}
