package servlet;

import com.alibaba.fastjson.JSON;
import dao.UserDao;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class UserServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF8");

        String type = req.getParameter("type");
        String userid = req.getParameter("userid");
        String username =req.getParameter("username");
        String password =req.getParameter("password");
        String usertype =req.getParameter("usertype");
        String userintergral =req.getParameter("userintergral");
        String userphone =req.getParameter("userphone");
        String useridcard =req.getParameter("useridcard");
        if("1".equals(type)){
            if(new UserDao().checkUser(userid,password)){
                System.out.println("用户名密码正常！");
                User user = new UserDao().getUser(userid);
                String jsonStr = JSON.toJSONString(user);
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);

            }
        }
        else if("2".equals(type)){
            User user2 = new UserDao().getUser(userid);
            String jsonStr = JSON.toJSONString(user2);
            PrintWriter writer = resp.getWriter();
            writer.write(jsonStr);
        }
        else if("3".equals(type)){
            if(new UserDao().addUser(userid,username,password,usertype)){
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }
        }
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF8");

        String type = req.getParameter("type");
        String userid = req.getParameter("userid");
        String username =req.getParameter("username");
        String usertype =req.getParameter("usertype");
        String password =req.getParameter("password");
        int userintergral = Integer.parseInt(req.getParameter("userintergral"));
        String userphone =req.getParameter("userphone");
        String useridcard =req.getParameter("useridcard");
        if("1".equals(type)){
            if(new UserDao().addUser(userid,username,password,usertype)){
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }
        }
        else if("2".equals(type)){
            //更改信息
            System.out.println("要修改的用户ID为"+ userid);
            if(new UserDao().updateUser(userid,username,password,userphone,useridcard)){
                System.out.println("修改的用户ID为"+ userid+ "成功");
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);

            }
        }
    }
}
