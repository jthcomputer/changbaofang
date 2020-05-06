package servlet;

import com.alibaba.fastjson.JSON;
import dao.HotelDao;
import entity.Hotel;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;



public class HotelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF8");
        int hotelid = Integer.parseInt(req.getParameter("hotelid"));
        String hotelcity = req.getParameter("hotelcity");
        String hotelname = req.getParameter("hotelname");
        String hoteltype = req.getParameter("hoteltype");
        String hotelstar = req.getParameter("hotelstar");
        String hotellocal = req.getParameter("hotellocal");
        String hotelindex = req.getParameter("hotelindex");
        String hotelcall = req.getParameter("hotelcall");
        String hotelstatus = req.getParameter("hotelstatus");
        String type = req.getParameter("type");
        int hotelroomnum = Integer.parseInt(req.getParameter("hotelroomnum"));
        int hotelprice = Integer.parseInt(req.getParameter("hotelprice"));
        String hotelpic = req.getParameter("hotelpic");

        if ("1".equals(type)){
            //得到所有酒店信息
            ArrayList<Hotel> hotelArrayList=new HotelDao().getAllHotel();
            String jsonStr = JSON.toJSONString(hotelArrayList);
            PrintWriter writer = resp.getWriter();
            writer.write(jsonStr);
        }
        else if("2".equals(type)) {
            //删除酒店
            if (new HotelDao().deleteHotel(hotelid)) {
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }
        }

        else if("3".equals(type)){
            //添加酒店
            if(new HotelDao().addHotel(hotelid,hotelname,hotelcity,hoteltype,hotelstar,hotelstatus,hotellocal,hotelindex,hotelcall,hotelroomnum,hotelprice)){
                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }



        }
        else if ("4".equals(type)){
            //更改酒店
            if(new HotelDao().updateHotel(hotelid,hotelname,hotelcity,hoteltype,hotelstar,hotellocal,hotelindex,hotelcall,hotelroomnum,hotelprice)){

                String jsonStr = JSON.toJSONString("true");
                PrintWriter writer = resp.getWriter();
                writer.write(jsonStr);
            }

        }
        else if ("5".equals(type)){
            //得到某个酒店的具体信息
            Hotel hotel = new HotelDao().getOneHotel(hotelid);
            String jsonStr = JSON.toJSONString(hotel);
            PrintWriter writer = resp.getWriter();
            writer.write(jsonStr);
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {




    }


}
